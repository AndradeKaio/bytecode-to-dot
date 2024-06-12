#include "../include/BytecodeDot.h"
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

    unsigned int labelCount = 0;

    std::string getOperands(Instruction* I) {
      std::string operands = " ";
      switch(I->getOpcode()){
        case Instruction::PHI:{
          PHINode *phi = dyn_cast<PHINode>(I);
          for(unsigned int i=0; i<phi->getNumIncomingValues(); i++){
            operands += "[" + phi->getIncomingValue(i)->getNameOrAsOperand()
              + ", BB" + phi->getIncomingBlock(i)->getNameOrAsOperand().substr(1) + "]";
            if(i != phi->getNumIncomingValues()-1){
              operands+=", ";
            }else{
              operands+="\n";
            }
          }
          break;
        }
        case Instruction::Br:{
          unsigned int numberOfOperands = I->getNumOperands();
          if(numberOfOperands == 1){
            operands += "BB" + I->getOperand(0)->getNameOrAsOperand().substr(1);
          }else{
            operands += I->getOperand(0)->getNameOrAsOperand();
            for(unsigned int i=1; i<numberOfOperands; i++){
              operands += ", BB" + I->getOperand(i)->getNameOrAsOperand().substr(1);
            }
          }
          break;
        }
        case Instruction::Ret:{
          if(I->getNumOperands() > 0) { operands += I->getOperand(0)->getNameOrAsOperand();}
          break;
        }
        case Instruction::Call: {
          CallInst *call = dyn_cast<CallInst>(I);
          operands += call->getCalledFunction()->getNameOrAsOperand() + "(";
          for(unsigned int i=0; i<call->arg_size(); i++){
            operands += call->getArgOperand(i)->getNameOrAsOperand();
            if(i != call->arg_size() - 1){
              operands += ", ";
            }
          }
          operands += ")";
          break;
        }
        default: {
          for(unsigned int i=0; i<I->getNumOperands(); i++){
            operands += " " + I->getOperand(i)->getNameOrAsOperand();
            if(i != I->getNumOperands()- 1){
              operands += ", ";
            }
          }
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
          instStr += getOperands(&I);
          so << I;
          file << "\t " + instStr << "\\l";
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

// char BytecodeDot::ID = 0;
// static RegisterPass<BytecodeDot> X("bytecodedot", "Prints the cfg into dot files", false, false);
