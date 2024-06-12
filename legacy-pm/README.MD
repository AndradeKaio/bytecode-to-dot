You can also use this pass with the Legacy Pass Manager!

1. Move the `BytecodeDot.cpp` to a folder called `BytecodeDot` inside your LLVM directory

    In my case:
    ```/llvm-project/llvm/lib/Transforms/BytecodeDot```
2. Add this folder to the list of subfolders inside ```/llvm-project/llvm/lib/Transforms/CMakeLists.txt```
    ```
        ...
        add_subdirectory(BytecodeDot)
    ```
3. Build the LLVM with your pass

    Go to your build directory and build it again
    ```shell
    $ cd /llvm-project/llvm/lib/Transforms/build/
    $ cmake --build . --parallel 4
    ```
4. Run the pass
    Go to your build directory and run
    ```shell
    opt -load ../lib/BytecodeDot.dylib -bytecodedot --bugpoint-enable-legacy-pm  < test.ll > /dev/null
    ```
