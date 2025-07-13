# Minimum CMake version
cmake_minimum_required(VERSION 3.22.0)

add_library(HelloLib HelloLib.c hello_support.c)

target_include_directories(HelloLib
                           INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
                           )