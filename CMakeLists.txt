cmake_minimum_required(VERSION 3.16)
project(Test)

include(CMake/CPM.cmake)

CPMAddPackage(
        NAME data_structrues
        GIT_REPOSITORY git@github.com:eyalamirmusic/cpp_data_structures.git
        GIT_TAG origin/main)

set(CMAKE_CXX_STANDARD 17)

add_executable(Test main.cpp)
target_include_directories(Test PRIVATE ${data_structrues_SOURCE_DIR})