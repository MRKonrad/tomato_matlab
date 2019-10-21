cmake_minimum_required(VERSION 2.8)

project(Tomato_matlab)
set(CMAKE_MACOSX_RPATH 1)

include(cmake/tomato_download.cmake)
include(cmake/octave_download.cmake)

# OCTAVE
set(OCTAVE_LOCATION_HINTS
        /usr/local/Cellar/octave/5.1.0_6/lib/octave/5.1.0/
        /usr/lib/x86_64-linux-gnu/
        /usr/lib/x86_64-linux-gnu/octave
        /usr/lib/x86_64-linux-gnu/octave/4.0.0
        /usr/lib/x86_64-linux-gnu/octave/4.0.0/oct
        /usr/lib64/
        ${PROJECT_SOURCE_DIR}/octave/mingw64/
        ${PROJECT_SOURCE_DIR}/octave/mingw64/bin
        ${PROJECT_SOURCE_DIR}/octave/mingw64/lib)
find_library(octave NAMES octave HINTS ${OCTAVE_LOCATION_HINTS})
find_library(octinterp NAMES octinterp HINTS ${OCTAVE_LOCATION_HINTS})
#find_library(freetype NAMES freetype HINTS ${OCTAVE_LOCATION_HINTS})

set(OCTAVELIBS ${octave} ${octinterp} ${freetype})
message(${OCTAVELIBS})
include_directories(/usr/local/Cellar/octave/5.1.0_6/include/octave-5.1.0/octave/)
include_directories(/usr/include/octave-4.0.0/octave/)

find_library(TomatoLib NAMES TomatoLib HINTS
        ${PROJECT_SOURCE_DIR}/Tomato/lib_shared
        ${PROJECT_SOURCE_DIR}/lib_shared
        ${PROJECT_SOURCE_DIR}/Tomato/Tomato/lib_shared)
include_directories(${PROJECT_SOURCE_DIR}/Tomato/include)
message(STATUS ${TomatoLib})

#matlab_add_mex(NAME playground_mex mex mex/aaa.cpp)
add_library(playground_mex SHARED mex/playground.cpp)
set_target_properties(playground_mex PROPERTIES SUFFIX ".mex")
#set_target_properties(playground_mex PROPERTIES SUFFIX ".mexmaci64")
set_target_properties(playground_mex PROPERTIES PREFIX "")
target_link_libraries(playground_mex ${TomatoLib} ${OCTAVELIBS})

## MATLAB
#find_package(MATLAB REQUIRED)
#include_directories(${Matlab_INCLUDE_DIRS})
#
#find_library(TomatoLib NAMES TomatoLib HINTS ${PROJECT_SOURCE_DIR}/Tomato/lib_shared)
#include_directories(${PROJECT_SOURCE_DIR}/Tomato/include)
#message(STATUS ${TomatoLib})
#
##matlab_add_mex(NAME playground_mex mex mex/aaa.cpp)
#add_library(playground_mex SHARED mex/playground.cpp)
#set_target_properties(playground_mex PROPERTIES SUFFIX ".mexmaci64")
#set_target_properties(playground_mex PROPERTIES PREFIX "")
#target_link_libraries(playground_mex ${TomatoLib} ${Matlab_MEX_LIBRARY})
