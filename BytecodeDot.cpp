#include <fstream>
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;


namespace {

  struct BytecodeDot: public FunctionPass {

    static char ID;
    unsigned int labelCount = 0;

    BytecodeDot(): FunctionPass(ID){}

    std::string getValueName(Value *value){
      if(!value->hasName()){
        value->setName(std::to_string(labelCount++));
      }
      return value->getName().str();
    }

    std::string getOperands(Instruction* I) {
      std::string operands;
      switch(I->getOpcode()){
        case Instruction::PHI:{
          errs() << "PHI ";
          PHINode *phi = dyn_cast<PHINode>(I);
          for(unsigned int i=0; i<phi->getNumIncomingValues(); i++){
            operands += "[" + phi->getIncomingValue(i)->getNameOrAsOperand()
              + ", BB" + phi->getIncomingBlock(i)->getNameOrAsOperand().substr(1) + "]";
            if(i != phi->getNumIncomingValues()-1){
              operands+=",";
            }else{
              operands+="\n";
            }
          }
          break;
        }
        case Instruction::Br:{
          errs() << "BRANCH ";
          unsigned int numberOfOperands = I->getNumOperands();
          if(numberOfOperands == 1){
            operands = "BB" + I->getOperand(0)->getNameOrAsOperand().substr(1);
          }else{
            operands = I->getOperand(0)->getNameOrAsOperand();
            for(unsigned int i=1; i<numberOfOperands; i++){
              operands += ", BB" + I->getOperand(i)->getNameOrAsOperand().substr(1);
            }
          }
          break;
        }
        case Instruction::Ret:{
          errs() << "RET ";
          if(I->getNumOperands() > 0) { operands += I->getOperand(0)->getNameOrAsOperand();}
          break;
        }
      }
      return operands;
    }

    std::string getBBName(BasicBlock *BB){
      std::string block_address;
      raw_string_ostream string_stream(block_address);
      BB->printAsOperand(string_stream, false);
      return string_stream.str().substr(1);
    }

    bool runOnFunction(Function &F) override {
      std::string funcName = F.getName().str();

      errs() << "Function name: ";
      errs().write_escaped(funcName) << '\n';

      std::ofstream file(funcName + ".dot");
      file << "digraph \"CFG of " + funcName +  " function\"{\n";

      for(BasicBlock &BB: F) {
        auto bb_name = getBBName(&BB);
        file << "\tBB" + bb_name + "[shape=record,label=\"{BB" + bb_name + ":\\l\\l\n";

        // prints all the instructions
        std::string str;
        raw_string_ostream so(str);
        for (Instruction &I : BB) {
          std::string instStr;
          // ignoring branch instructions
          if(!I.getType()->isVoidTy()){
            instStr = I.getNameOrAsOperand() + " = ";
          }

          // set the opcode
          instStr += I.getOpcodeName();

          // get the operands
          for(unsigned int i=0; i<I.getNumOperands(); i++){
            instStr += I.getOperand(i)->getNameOrAsOperand();
          }
          errs() << getOperands(&I) << "\n";
          errs() << instStr << "\n";
          so << I;
          file << "\t " + so.str() << "\\l";
          str.clear();
        }
        file << "\t}\"];\n";

        // get the successors of the bb
        Instruction *terminator = BB.getTerminator();
        if(terminator){
          for(unsigned int i=0; i<terminator->getNumSuccessors(); i++){
            BasicBlock *succ = terminator->getSuccessor(i);     
            auto succ_name = getBBName(succ);
            file << "\tBB"+ bb_name + " -> BB" + succ_name + "\n";
          }
        }
      }
      file << "}\n";
      file.close();
      return false;
    }
  };
}

char BytecodeDot::ID = 0;
static RegisterPass<BytecodeDot> X("bytecodedot", "Prints the cfg into dot files", false, false);

