if(NOT WIN32)
    message("WARNING! OCTAVE_DOWNLOAD.cmake WORKS ONLY ON WINDOWS")
endif()

if (WIN32)
    file(DOWNLOAD
        "https://ftpmirror.gnu.org/octave/windows/octave-5.1.0-w64.zip"
        "${PROJECT_SOURCE_DIR}/octave/octave.zip"
        STATUS status LOG log)
    list(GET status 0 status_code)
    list(GET status 1 status_string)

    execute_process( COMMAND cmake -E tar xzf "${PROJECT_SOURCE_DIR}/Octave/octave.zip"
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/octave/)
endif()
