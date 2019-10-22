# Tomato Matlab

Running TOMATO (https://github.com/MRKonrad/tomato) in Matlab/Octave

| Status | System |
| ------ | ------ |
|[![Build Status](https://travis-ci.com/MRKonrad/tomato_matlab.svg?branch=master)](https://travis-ci.com/MRKonrad/tomato_matlab) | Mac and Linux build (Travis) |  
|[![Build status](https://ci.appveyor.com/api/projects/status/md078r5kfj92y0f2?svg=true)](https://ci.appveyor.com/project/MRKonrad/tomato-matlab) | Windows build (Appveyor)|

## Issues
* Error 1 on macos:
```command
Invalid MEX-file '/Users/kwerys/Code/tomato_matlab/cmake-build-debug/playground_mex.mexmaci64':
dlopen(/Users/kwerys/Code/tomato_matlab/cmake-build-debug/playground_mex.mexmaci64, 6): Library not loaded:
/usr/local/opt/freetype/lib/libfreetype.6.dylib
  Referenced from: /usr/local/opt/octave/lib/octave/5.1.0/liboctinterp.7.dylib
  Reason: Incompatible library version: liboctinterp.7.dylib requires version 24.0.0 or later, but libfreetype.6.dylib provides version
  18.0.0.
```
* Error 1 explanation: matlab has its own versions of libraries, for example 
```command
> otool -L /Applications/MATLAB_R2016b.app/bin/maci64/libfreetype.6.dylib 

/Applications/MATLAB_R2016b.app/bin/maci64/libfreetype.6.dylib:
	@rpath/libfreetype.6.dylib (compatibility version 18.0.0, current version 18.1.0)
	/usr/lib/libz.1.dylib (compatibility version 1.0.0, current version 1.2.5)
	/usr/lib/libbz2.1.0.dylib (compatibility version 1.0.0, current version 1.0.5)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1197.1.1)
```
* Error 1 possible solutions: 
  * use newer matlab version
  * use older octave versions

## Current status

* linux - works :)
* mac - works :)
* windows in appveyor - works :)
* windows in travis - octave not working 
```
The command "octave-cli ${TRAVIS_BUILD_DIR}/playground.m" exited with 127. 
Cannot find file at '..\lib\octave.portable\tools\octave\bin\octave-cli.exe' (C:\ProgramData\chocolatey\lib\octave.portable\tools\octave\bin\octave-cli.exe). This usually indicates a missing or moved file.
```

## TODO
* Tomato shared lib that can be linked from windows 
* Cmake install that generates all the correct matlab and octave extentions
* Deployment 



