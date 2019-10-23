# OCTAVE PATHS MACOS
set(OCTAVE_LOCATION_HINTS ${OCTAVE_LOCATION_HINTS}
        /usr/local/Cellar/octave/4.4.0_1/lib/octave/4.4.0/
        /usr/local/Cellar/octave/5.1.0_6/lib/octave/5.1.0/)
include_directories(/usr/local/Cellar/octave/4.4.0_1/include/octave-4.4.0/octave/)
include_directories(/usr/local/Cellar/octave/5.1.0_6/include/octave-5.1.0/octave/)

# OCTAVE PATHS LINUX
set(OCTAVE_LOCATION_HINTS ${OCTAVE_LOCATION_HINTS}

        /usr/lib/x86_64-linux-gnu/
        /usr/lib/x86_64-linux-gnu/octave
        /usr/lib/x86_64-linux-gnu/octave/4.0.0
        /usr/lib/x86_64-linux-gnu/octave/4.0.0/oct
        /usr/lib64/)
include_directories(/usr/include/octave-4.0.0/octave/)

# OCTAVE PATHS WINDOWS
set(OCTAVE_LOCATION_HINTS ${OCTAVE_LOCATION_HINTS}
        C:/ProgramData/chocolatey/lib/octave.portable/tools/octave/mingw64/bin
        C:/ProgramData/chocolatey/lib/octave.portable/tools/octave/mingw64/lib
        C:/ProgramData/chocolatey/lib/octave.portable/tools/octave/mingw64/lib/octave
        C:/ProgramData/chocolatey/lib/octave.portable/tools/octave/mingw64/lib/octave/5.1.0)
include_directories(C:/ProgramData/chocolatey/lib/octave.portable/tools/octave/mingw64/include/octave-5.1.0/octave/)

# OCTAVE
find_library(octave NAMES octave octave-7 liboctave-7 HINTS ${OCTAVE_LOCATION_HINTS})
find_library(octinterp NAMES octinterp octinterp-7 liboctinterp-7 HINTS ${OCTAVE_LOCATION_HINTS})
set(OCTAVELIBS ${octave} ${octinterp})