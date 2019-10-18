cmake_minimum_required (VERSION 2.8)

project (Tomato)
set(CMAKE_MACOSX_RPATH 1)

include(cmake/tomato_download.cmake)

# MATLAB
find_package(OCTAVE REQUIRED)
include_directories(${OCTAVE_INCLUDE_DIRS})

find_library(TomatoLib NAMES TomatoLib HINTS ${PROJECT_SOURCE_DIR}//Tomato//lib_shared)
include_directories(${PROJECT_SOURCE_DIR}/Tomato/include)
message(STATUS ${TomatoLib})

#matlab_add_mex(NAME playground_mex mex mex/aaa.cpp)
add_library(NAME playground_mex SHARED mex/aaa.cpp)
target_link_libraries(playground_mex ${TomatoLib} ${OCTAVE})


