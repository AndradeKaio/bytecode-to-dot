cmake_minimum_required(VERSION 3.13)

project(BytecodeDot)

set(LLVM_INSTALL_DIR "" CACHE PATH 
  "LLVM INSTALLATION DIR")

list(APPEND CMAKE_PREFIX_PATH "${LLVM_INSTALL_DIR}/lib/cmake/llvm/")
find_package(LLVM REQUIRED CONFIG)

include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})
add_definitions(${LLVM_DEFINITIONS})

# set(CMAKE_CXX_STANDARD 17 CACHE STRING "")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")

# if (NOT LLVM_ENABLE_RTTI)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
# endif()

# Set the build type to Debug
set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type" FORCE)


set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/lib")


SET(CMAKE_OSX_DEPLOYMENT_TARGET 13.0)


# Specify the LLVM components required for your project
# llvm_map_components_to_libnames(LLVM_LIBS
#     core
#     support
#     irreader
#     analysis
#     transforms
#     passes
#     option
#     target
#     # Add more components as needed
# )

# Set the target architecture to ARM64
set(CMAKE_OSX_ARCHITECTURES "arm64")

add_subdirectory(lib)

