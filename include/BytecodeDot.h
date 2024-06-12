#ifndef BYTECODEDOT_H
#define BYTECODEDOT_H

#include "llvm/IR/PassManager.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/PassManager.h"
#include <llvm/Support/raw_ostream.h>

using namespace llvm;
using namespace std;

namespace BytecodeDot {

    struct BytecodeDotPass : public PassInfoMixin<BytecodeDotPass> {
      explicit BytecodeDotPass(llvm::raw_ostream &OS) : OS(OS) {}

        PreservedAnalyses run(Function &F,
                              FunctionAnalysisManager &FAM);

        string getBBName(BasicBlock *BB);
        bool runOnFunction(Function &F);
        string getOperands(Instruction* I);


       
        void runBasicBlock(Function::iterator &bb);
        void runInstruction(BasicBlock::iterator it, vector<string> &target);
      private:
        llvm::raw_ostream &OS;
    };

}

#endif
