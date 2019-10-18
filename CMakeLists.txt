cmake_minimum_required (VERSION 2.8)

project (Tomato)
set(CMAKE_MACOSX_RPATH 1)

include(cmake/tomato_download.cmake)

# MATLAB
find_package(MATLAB REQUIRED)
include_directories(${Matlab_INCLUDE_DIRS})

find_library(TomatoLib NAMES TomatoLib HINTS ${PROJECT_SOURCE_DIR}//Tomato//lib_shared)
include_directories(${PROJECT_SOURCE_DIR}/Tomato/include)
message(STATUS ${TomatoLib})

matlab_add_mex(NAME playground_mex mex mex/aaa.cpp)
target_link_libraries(playground_mex ${TomatoLib})
