if (WIN32)
    set(SYSTEM_NAME "Windows_x64")
endif (WIN32)
if (UNIX AND NOT APPLE)
    set(SYSTEM_NAME "linux")
endif (UNIX AND NOT APPLE)
if (APPLE)
    set(SYSTEM_NAME "osx")
endif (APPLE)

MESSAGE(STATUS "https:/github.com/MRKonrad/tomato/releases/download/v0.4/TomatoLib_v0.4_${SYSTEM_NAME}.zip")

if (NOT EXISTS ${PROJECT_SOURCE_DIR}/Tomato/Tomato.zip)
    file(DOWNLOAD
            "https:/github.com/MRKonrad/tomato/releases/download/v0.4/TomatoLib_v0.4_${SYSTEM_NAME}.zip"
            "${PROJECT_SOURCE_DIR}/Tomato/Tomato.zip"
            STATUS status LOG log)
    list(GET status 0 status_code)
    list(GET status 1 status_string)

    execute_process( COMMAND dir "${PROJECT_SOURCE_DIR}/Tomato/"
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/Tomato/)
    execute_process( COMMAND cmake -E tar xzf "${PROJECT_SOURCE_DIR}/Tomato/Tomato.zip"
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/Tomato/)
    execute_process( COMMAND dir "${PROJECT_SOURCE_DIR}/Tomato/"
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/Tomato/)
endif()


