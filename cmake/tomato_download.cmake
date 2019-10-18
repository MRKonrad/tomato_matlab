
if (WIN32)
    set(SYSTEM_NAME "Windows_x64")
endif (WIN32)
if (UNIX AND NOT APPLE)
    set(SYSTEM_NAME "linux")
endif (UNIX AND NOT APPLE)
if (APPLE)
    set(SYSTEM_NAME "osx")
endif (APPLE)

file(DOWNLOAD https://github.com/MRKonrad/tomato/releases/download/v0.4/TomatoLib_v0.4_${SYSTEM_NAME}.zip TomatoLib.zip)
