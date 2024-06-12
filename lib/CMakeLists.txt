add_library(BytecodeDot MODULE
  BytecodeDot.cpp
  BytecodeDotPlugin.cpp
  )

target_include_directories(BytecodeDot PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/../include")
