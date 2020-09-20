cmake_minimum_required(VERSION 2.8)
project (eq2emu)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})

add_subdirectory(EQ2/source/LoginServer)
add_subdirectory(EQ2/source/WorldServer)
