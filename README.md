# Tomato Matlab

Running TOMATO (<https://github.com/MRKonrad/tomato>) in Matlab/Octave

| Status | System |
| ------ | ------ |
|[![Build Status](https://travis-ci.com/MRKonrad/tomato_matlab.svg?branch=master)](https://travis-ci.com/MRKonrad/tomato_matlab) | Mac and Linux build (Travis) |  
|[![Build status](https://ci.appveyor.com/api/projects/status/md078r5kfj92y0f2?svg=true)](https://ci.appveyor.com/project/MRKonrad/tomato-matlab) | Windows build (Appveyor)|

## Limitations

*   [yamlmatlab](https://github.com/ewiger/yamlmatlab.git) does not work with octave. Hence no yaml modifications within the code are possible.

*   under OSX and Linux deployed mex has been compiled with specific version of octave with specific version of brew/apt. Hence deployed mexes are not very useful unless you are using this specific software versions.

*   under Windows octave is compiled with mingw and Tomato is compiled with VS. It seems that linkage does not work in this situation.

## Current status

*   current version depends on funny paths to the octave library provided by brew/apt/choco as in [cmake/octave_find.cmake](cmake/octave_find.cmake). It would be great to cut the dependency on packet managers and to have my own octave build.

*   linux - octave works :smiley:, octave mex with Tomato works :smiley:

*   mac - octave works :smiley:, octave mex with Tomato works :smiley:

*   windows in appveyor - octave works (with mingw) :smiley:, octave mex with Tomato does not work (mingw and vs dlls do not talk?) :confused:

*   windows in travis - octave not working :confused:
```
The command "octave-cli ${TRAVIS_BUILD_DIR}/playground.m" exited with 127. 
Cannot find file at '..\lib\octave.portable\tools\octave\bin\octave-cli.exe' (C:\ProgramData\chocolatey\lib\octave.portable\tools\octave\bin\octave-cli.exe). This usually indicates a missing or moved file.
```

## Issues

*   Error 1 on macos:
```command
Invalid MEX-file '/Users/kwerys/Code/tomato_matlab/cmake-build-debug/playground_mex.mexmaci64':
dlopen(/Users/kwerys/Code/tomato_matlab/cmake-build-debug/playground_mex.mexmaci64, 6): Library not loaded:
/usr/local/opt/freetype/lib/libfreetype.6.dylib
  Referenced from: /usr/local/opt/octave/lib/octave/5.1.0/liboctinterp.7.dylib
  Reason: Incompatible library version: liboctinterp.7.dylib requires version 24.0.0 or later, but libfreetype.6.dylib provides version
  18.0.0.
```
*   Error 1 explanation: matlab has its own versions of libraries, for example 
```command
> otool -L /Applications/MATLAB_R2016b.app/bin/maci64/libfreetype.6.dylib 

/Applications/MATLAB_R2016b.app/bin/maci64/libfreetype.6.dylib:
	@rpath/libfreetype.6.dylib (compatibility version 18.0.0, current version 18.1.0)
	/usr/lib/libz.1.dylib (compatibility version 1.0.0, current version 1.2.5)
	/usr/lib/libbz2.1.0.dylib (compatibility version 1.0.0, current version 1.0.5)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1197.1.1)
```
*   Error 1 possible solutions: 
  *   use newer matlab version
  *   use older octave versions

## References

*   <https://www.scivision.dev/windows-matlab-octave-continuous-integration/>
*   <https://github.com/MRKonrad/tomato>