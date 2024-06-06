#include <fstream>
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;


namespace {

  struct BytecodeDot: public FunctionPass {

    static char ID;
    BytecodeDot(): FunctionPass(ID){}

    std::string get_block_reference(BasicBlock *BB){
      std::string block_address;
      raw_string_ostream string_stream(block_address);
      BB->printAsOperand(string_stream, false);
      return string_stream.str().substr(1);
    }

    bool runOnFunction(Function &F) override {
      std::string funcName = F.getName().str();
      std::ofstream file(funcName + ".dot");
      file << "digraph \"CFG of " + funcName +  " function\"{\n";

      errs() << "Function name: ";
      errs().write_escaped(funcName) << '\n';

      for(BasicBlock &BB: F) {
        errs() << "BasicBlock: ";
        auto bb_name = get_block_reference(&BB);
        file << "\tBB" + bb_name + "[shape=record,label=\"{BB" + bb_name + ":\\l\\l\n";
        std::string str;
        raw_string_ostream so(str);
        for (Instruction &I : BB) {
          so << I;
          file << "\t " + so.str() << "\\l";
          str.clear();
          // if(I.isterminator()) {
          //   
          // }
        }
        file << "\t}\"];\n";
        Instruction *terminator = BB.getTerminator();
        if(terminator){
          for(unsigned int i=0; i<terminator->getNumSuccessors(); i++){
            BasicBlock *succ = terminator->getSuccessor(i);     
            auto succ_name = get_block_reference(succ);
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

