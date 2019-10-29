### Tomato_matlab
### sample cmake command: cmake . -DCMAKE_BUILD_TYPE=DEBUG -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=../mex -DBUILD_USING_OCTAVE=OFF -DBUILD_USING_MATLAB=ON

cmake_minimum_required(VERSION 2.8)

project(Tomato_matlab)
set(CMAKE_MACOSX_RPATH 1)

# to see external shared library
if (UNIX AND NOT APPLE)
    SET(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_RPATH}:$ORIGIN")
elseif (APPLE)
    SET(CMAKE_INSTALL_RPATH "@loader_path")
endif()

# to get correct file sufixes (mexmaci64 etc)
include(cmake/matlab_suffix_configuration.cmake)

# an external library
include(cmake/tomato_download.cmake)
find_library(TomatoLib NAMES TomatoLib HINTS ${PROJECT_SOURCE_DIR}/TomatoLib/lib_shared)
include_directories(${PROJECT_SOURCE_DIR}/TomatoLib/include)
message(STATUS ${TomatoLib})

##############
### OCTAVE ###
##############

set(BUILD_USING_OCTAVE ON CACHE BOOL "")
if (BUILD_USING_OCTAVE)

    ### configure octave paths
    include(cmake/octave_find.cmake)

    ### add a target
    add_library(playground_octave_mex mexcpp/playground.cpp)
    set_target_properties(playground_octave_mex PROPERTIES SUFFIX ".mex")
    set_target_properties(playground_octave_mex PROPERTIES PREFIX "")
    target_link_libraries(playground_octave_mex ${TomatoLib} ${OCTAVELIBS})

    ### install
    install(TARGETS playground_octave_mex DESTINATION ${CMAKE_INSTALL_PREFIX})
    install(FILES ${TomatoLib} DESTINATION ${CMAKE_INSTALL_PREFIX})

endif(BUILD_USING_OCTAVE)

##############
### MATLAB ###
##############

set(BUILD_USING_MATLAB OFF CACHE BOOL "")
if (BUILD_USING_MATLAB)

    ### configure matlab paths
    find_package(MATLAB REQUIRED)
    include_directories(${Matlab_INCLUDE_DIRS})
    MESSAGE("Matlab_LIBRARIES:" ${Matlab_LIBRARIES})

    ### add a target
    ## this way of dealing with matlab works well too:
    # matlab_add_mex(NAME playground_matlab_mex mexcpp mexcpp/playground.cpp)
    # target_link_libraries(playground_matlab_mex ${TomatoLib} ${Matlab_LIBRARIES})

    add_library(playground_matlab_mex mexcpp/playground.cpp)
    set_target_properties(playground_matlab_mex PROPERTIES SUFFIX .${MATLAB_SUFFIX})
    set_target_properties(playground_matlab_mex PROPERTIES PREFIX "")
    target_link_libraries(playground_matlab_mex ${TomatoLib} ${Matlab_LIBRARIES})

    ### install
    install(TARGETS playground_matlab_mex DESTINATION ${CMAKE_INSTALL_PREFIX})
    install(FILES ${TomatoLib} DESTINATION ${CMAKE_INSTALL_PREFIX})

endif(BUILD_USING_MATLAB)

#get_cmake_property(_variableNames VARIABLES)
#list (SORT _variableNames)
#foreach (_variableName ${_variableNames})
#    message(STATUS "${_variableName}=${${_variableName}}")
#endforeach()
