# Minimum CMake version
cmake_minimum_required(VERSION 3.22.0)

# Locate the Zephyr RTOS source
find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})

# Name the project
project(hello_blink_lib)

# Locate the source code for the application
target_sources(app PRIVATE src/main.c)

add_subdirectory(HelloLib)

target_link_libraries(app PRIVATE HelloLib)

target_include_directories(app PUBLIC
                          "${PROJECT_BINARY_DIR}"
                          )
                          