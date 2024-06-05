#include "llvm/IR/BasicBlock.h"
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;


namespace {

  struct BytecodeDot: public FunctionPass {

    static char ID;
    BytecodeDot(): FunctionPass(ID){}

    bool runOnFunction(Function &F) override {
      errs() << "Function name: ";
      errs().write_escaped(F.getName()) << '\n';
      for(BasicBlock &BB: F) {
        errs() << "BasicBlock: " << BB.getName() << "\n";
        for (Instruction &I : BB) {
          errs() << I << "\n";
        }
      }
      return false;
    }

  };
}

char BytecodeDot::ID = 0;
static RegisterPass<BytecodeDot> X("bytecodedot", "Prints the cfg into dot files", false, false);

