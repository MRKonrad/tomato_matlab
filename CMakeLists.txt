cmake_minimum_required(VERSION 2.8)

project(Tomato_matlab)
set(CMAKE_MACOSX_RPATH 1)

#include(cmake/tomato_download.cmake)
#include(cmake/octave_download.cmake)

#find_library(TomatoLib NAMES TomatoLib HINTS
#        ${PROJECT_SOURCE_DIR}/Tomato/lib_shared
#        ${PROJECT_SOURCE_DIR}/Tomato/lib_static)
#include_directories(${PROJECT_SOURCE_DIR}/Tomato/include)
#message(STATUS ${TomatoLib})

set(BUILD_USING_OCTAVE ON BOOL "")
if (BUILD_USING_OCTAVE)
    include(cmake/octave_find.cmake)
    add_library(playground_octave_mex SHARED mex/playground.cpp)
    set_target_properties(playground_octave_mex PROPERTIES SUFFIX ".mex")
    #set_target_properties(playground_octave_mex PROPERTIES SUFFIX ".mexmaci64")
    set_target_properties(playground_octave_mex PROPERTIES PREFIX "")
    target_link_libraries(playground_octave_mex ${TomatoLib} ${OCTAVELIBS})

    install(TARGETS playground_octave_mex DESTINATION ${CMAKE_INSTALL_PREFIX})
endif(BUILD_USING_OCTAVE)

set(BUILD_USING_MATLAB OFF BOOL "")
if (BUILD_USING_MATLAB)
    find_package(MATLAB REQUIRED)
    include_directories(${Matlab_INCLUDE_DIRS})

    find_library(TomatoLib NAMES TomatoLib HINTS ${PROJECT_SOURCE_DIR}/Tomato/lib_shared)
    include_directories(${PROJECT_SOURCE_DIR}/Tomato/include)
    message(STATUS ${TomatoLib})

    # matlab_add_mex(NAME playground_matlab_mex mex mex/aaa.cpp) # works well too
    add_library(playground_mex SHARED mex/playground.cpp)
    set_target_properties(playground_matlab_mex PROPERTIES SUFFIX ".mexmaci64")
    set_target_properties(playground_matlab_mex PROPERTIES PREFIX "")
    target_link_libraries(playground_matlab_mex ${TomatoLib} ${Matlab_MEX_LIBRARY})
    install(TARGETS playground_matlab_mex DESTINATION ${CMAKE_INSTALL_PREFIX})
endif(BUILD_USING_MATLAB)
