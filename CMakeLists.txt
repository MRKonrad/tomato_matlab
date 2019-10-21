cmake_minimum_required(VERSION 2.8)

project(Tomato_matlab)
set(CMAKE_MACOSX_RPATH 1)

include(cmake/tomato_download.cmake)

# OCTAVE
find_library(octave NAMES octave HINTS /usr/local/Cellar/octave/5.1.0_6/lib/octave/5.1.0/)
find_library(octinterp NAMES octinterp HINTS /usr/local/Cellar/octave/5.1.0_6/lib/octave/5.1.0/)
find_library(freetype NAMES freetype HINTS /usr/local/opt/freetype/lib/)

set(OCTAVELIBS ${octave} ${octinterp} ${freetype})
message(${octave})
message(${OCTAVELIBS})
include_directories(/usr/local/Cellar/octave/5.1.0_6/include/octave-5.1.0/octave/)

find_library(TomatoLib NAMES TomatoLib HINTS ${PROJECT_SOURCE_DIR}/Tomato/lib_shared)
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
