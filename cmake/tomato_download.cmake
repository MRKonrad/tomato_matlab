if (WIN32)
    set(SYSTEM_NAME "Windows_x64")
endif (WIN32)
if (UNIX AND NOT APPLE)
    set(SYSTEM_NAME "linux")
endif (UNIX AND NOT APPLE)
if (APPLE)
    set(SYSTEM_NAME "osx")
endif (APPLE)

MESSAGE(STATUS "https:/github.com/MRKonrad/tomato/releases/download/v0.4.1/TomatoLib_v0.4.1_${SYSTEM_NAME}.zip")

if (NOT EXISTS ${PROJECT_SOURCE_DIR}/TomatoLib/Tomato.zip)
    file(DOWNLOAD
            "https:/github.com/MRKonrad/tomato/releases/download/v0.4.1/TomatoLib_v0.4.1_${SYSTEM_NAME}.zip"
            "${PROJECT_SOURCE_DIR}/TomatoLib/Tomato.zip"
            STATUS status LOG log)
    list(GET status 0 status_code)
    list(GET status 1 status_string)

    execute_process( COMMAND pwd "${PROJECT_SOURCE_DIR}/TomatoLib/"
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/TomatoLib/)
    execute_process( COMMAND dir "${PROJECT_SOURCE_DIR}/TomatoLib/"
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/TomatoLib/)
    execute_process( COMMAND cmake -E tar xzf "${PROJECT_SOURCE_DIR}/TomatoLib/Tomato.zip"
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/TomatoLib/)
    execute_process( COMMAND dir "${PROJECT_SOURCE_DIR}/TomatoLib/"
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/TomatoLib/)
endif()
