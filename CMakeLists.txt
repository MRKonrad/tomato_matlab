cmake_minimum_required(VERSION 2.8)

project(Tomato_matlab)
set(CMAKE_MACOSX_RPATH 1)
#set(CMAKE_POSITION_INDEPENDENT_CODE ON) # TODO: to command line

# to get correct file sufixes (mexmaci64 etc)
include(cmake/matlab_suffix_configuration.cmake)

## an external library
#include(cmake/tomato_download.cmake)
#find_library(TomatoLib NAMES TomatoLib HINTS ${PROJECT_SOURCE_DIR}/Tomato/lib_shared)
#include_directories(${PROJECT_SOURCE_DIR}/Tomato/include)
#message(STATUS ${TomatoLib})

##########
# OCTAVE #
##########

set(BUILD_USING_OCTAVE ON CACHE BOOL "")
if (BUILD_USING_OCTAVE)

    ### configure octave paths
    include(cmake/octave_find.cmake)

    ### add a target
    add_library(playground_octave_mex SHARED mex/playground.cpp)
    set_target_properties(playground_octave_mex PROPERTIES SUFFIX ".mex")
    set_target_properties(playground_octave_mex PROPERTIES PREFIX "")
    target_link_libraries(playground_octave_mex ${TomatoLib} ${OCTAVELIBS})

    ### install
    install(TARGETS playground_octave_mex DESTINATION ${CMAKE_INSTALL_PREFIX})
    install(FILES ${CMAKE_BINARY_DIR}/playground_octave_mex.mex DESTINATION ${CMAKE_INSTALL_PREFIX} RENAME playground_octave_mex.${MATLAB_SUFFIX}) # the same file should be able to run with matlab

endif(BUILD_USING_OCTAVE)

##########
# MATLAB #
##########

set(BUILD_USING_MATLAB OFF CACHE BOOL "")
if (BUILD_USING_MATLAB)

    ### configure matlab paths
    find_package(MATLAB REQUIRED)
    include_directories(${Matlab_INCLUDE_DIRS})

    ### add a target
    # matlab_add_mex(NAME playground_matlab_mex mex mex/aaa.cpp) # works well too
    add_library(playground_mex SHARED mex/playground.cpp)
    set_target_properties(playground_matlab_mex PROPERTIES SUFFIX ${MATLAB_SUFFIX})
    set_target_properties(playground_matlab_mex PROPERTIES PREFIX "")
    target_link_libraries(playground_matlab_mex ${TomatoLib} ${Matlab_MEX_LIBRARY})

    ### install
    install(TARGETS playground_matlab_mex DESTINATION ${CMAKE_INSTALL_PREFIX})
    install(FILES ${CMAKE_BINARY_DIR}/playground_octave_mex.${MATLAB_SUFFIX} DESTINATION ${CMAKE_INSTALL_PREFIX} RENAME playground_octave_mex.mex) # the same file should be able to run with octave

endif(BUILD_USING_MATLAB)
