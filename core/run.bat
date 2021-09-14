@echo off

@REM Check file to compile is a .swift file
IF %2 NEQ .swift (
    echo Trying to Build File that is not a .swift
    echo Exiting...
    exit /b 1
)

@REM Look at the last compiled file cache
comp /M build\swift.tmp %3 > nul
IF %errorlevel% EQU 0 (
    IF EXIST bin\%1.exe (
        echo File %1%2 is already built
        exit
    )
)

@REM Setup ENV
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
set SWIFTFLAGS=-sdk %SDKROOT% -resource-dir %SDKROOT%\usr\lib\swift -I %SDKROOT%\usr\lib\swift -L %SDKROOT%\usr\lib\swift\windows

@REM Create Executable
mkdir build > nul 2>&1
echo Building Executable %1.exe
swiftc %SWIFTFLAGS% -emit-executable -j 4 -num-threads 4 -o build\%1.exe %3
mkdir bin > nul 2>&1
move build\%1.exe bin\%1.exe > nul 2>&1

IF %errorlevel% EQU 0 (
    @REM Create cache
    copy /Y %3 build\swift.tmp > nul
    echo Built %1%2 @ bin\%1.exe
) ELSE (
    echo Error Level: %errorlevel%
    echo Build %1%2 Failed!
)
@REM Done
echo Task Done %1%2
