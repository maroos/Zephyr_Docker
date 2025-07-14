# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.20.0)

set(BOARD esp32_devkitc_wroom/esp32/procpu)

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(hello_cpp_world_synch)

target_compile_features(app PUBLIC cxx_std_20)
target_sources(app PRIVATE src/main.cpp)
