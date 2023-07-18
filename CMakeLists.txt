cmake_minimum_required(VERSION 3.24)
project(Code C)

set(CMAKE_C_STANDARD 99)

add_executable(Code main.c)
target_link_libraries(Code libsodium.so)
