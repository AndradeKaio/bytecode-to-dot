
## [Bytecodes to Dot](https://homepages.dcc.ufmg.br/~fernando/classes/dcc888/assignment/)
A simple pass to print the LLVM CFG into a [dot](http://en.wikipedia.org/wiki/DOT_language) file following the four constraints:

- Each instruction must be printed with an opcode.
- All the arguments of an instruction must be printed next to this instruction.
- Arguments that do not have names, such as getelementptr in function calls, should not be printed.
- Type information should not be printed.


An assignment of the [DCC888](https://homepages.dcc.ufmg.br/~fernando/classes/dcc888/) course.
This project was developed using LLVM version 19.0.0, but should work on earlier versions as well.

##### Requirements
- [Clang](https://clang.llvm.org/)
- [LLVM](https://llvm.org/)
- [Graphviz](https://graphviz.org/)

### How to use it?
1. Create a new directory to build the pass

    ```shell
    $ mkdir build && cd build
    ```
2. Build the project
    ```shell
    $ cmake -G Ninja -DLLVM_INSTALL_DIR=/llvm-project/build/ .
    $ cmake --build .
    ```
3. Run the opt using the pass as a plugin
    ```shell
    $ opt -load-pass-plugin "build/libBytecodeDot.so" -passes=mem2reg,lcssa,BytecodeDotPass -S "test.ll" > /dev/null/
    ```
4. Generate the png from the `.dot` file
    ```shell
    $ dot -Tpng test.dot -o test.png && open test.png
    ```
    

