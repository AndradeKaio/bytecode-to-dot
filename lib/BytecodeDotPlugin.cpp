#include "BytecodeDot.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

using namespace llvm;

bool registerPipeline(StringRef Name, FunctionPassManager &FPM,
                      ArrayRef<PassBuilder::PipelineElement>) {
    
    if (Name == "bytecodedot") {
        FPM.addPass(BytecodeDot::BytecodeDotPass(errs()));
        return true;
    }

    return false;
}

PassPluginLibraryInfo getBytecodeDotPluginInfo() {
    return {LLVM_PLUGIN_API_VERSION, "bytecodedot", LLVM_VERSION_STRING, 
            [](PassBuilder &PB){
        PB.registerPipelineParsingCallback(registerPipeline);
    }};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getBytecodeDotPluginInfo();
}
