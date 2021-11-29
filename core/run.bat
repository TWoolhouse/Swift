@echo off

@REM %1     filename (no ext)
@REM %2     file extention
@REM %3     folder path
@REM %4     relative dir name
@REM %5     filepath

@REM Check file to compile is a .swift file
IF %2 NEQ .swift (
    echo Trying to Build File that is not a .swift
    echo Exiting...
    exit /b 1
)

@REM Generate ENV
SETLOCAL
SET FILENAME=%1%2
SET BUILD=build\%4
SET BIN=bin\%4

IF %4 EQU . (
    SET EXE=%1.exe
    SET Fcode=%BUILD%\%1.tmp
) ELSE (
    SET EXE=main.exe
    SET Fcode=%BUILD%\code.tmp
)

SET BINARY=%BIN%\%EXE%
SET LAUNCH=%BIN%\main.exe

SET Fcache=build\cache.tmp

mkdir build > nul 2>&1
mkdir bin > nul 2>&1

IF %4 EQU . (
    SET IFILES=%FILENAME%

    copy /Y %5 %Fcache% > nul
) ELSE (
    @REM Get list of all files in the current directory
    del build\files.tmp 2>nul 1>&2
    FOR /f "useback" %%i IN (`dir %3\*.swift /A-D /B /ON`) DO @<nul SET /p ="%3\%%i ">>build\files.tmp
    SET /P IFILES=<build\files.tmp

    @REM Create cache file of project
    del %Fcache% 2>nul 1>&2
    FOR /f "useback" %%i IN (`dir %3\*.swift /A-D /B /ON`) DO (
        type %3\%%i >> %Fcache%
    )
)

@REM Look at the last compiled files in the cache
comp /M %Fcode% %Fcache% > nul
IF %errorlevel% EQU 0 (
    IF EXIST %BINARY% (
        IF %4 EQU . copy %BINARY% %LAUNCH% > nul 2>&1
        echo File %FILENAME% is already built
        echo Exiting...
        exit
    )
)

@REM Setup ENV
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat" >nul
SET SWIFTFLAGS=-sdk %SDKROOT% -resource-dir %SDKROOT%\usr\lib\swift -I %SDKROOT%\usr\lib\swift:%3 -L %SDKROOT%\usr\lib\swift\windows:build
SET SWIFTCFG=-j 4 -num-threads 4

@REM Create Executable
echo Building Executable %EXE%
mkdir %BUILD% >nul 2>&1
mkdir %BIN% >nul 2>&1
swiftc %SWIFTFLAGS% %SWIFTCFG% -emit-executable -o %BUILD%\%EXE% %IFILES%
SET err=%errorlevel%
move %BUILD%\%EXE% %BINARY% >nul 2>&1
IF %4 EQU . copy %BINARY% %LAUNCH% > nul 2>&1

IF %err% EQU 0 (
    @REM Create cache
    move /Y %Fcache% %Fcode% > nul
    echo Built %FILENAME% @ %BINARY%
) ELSE (
    echo Error Level: %err%
    echo Build %FILENAME% Failed!
)
@REM Done
echo Task Done %FILENAME%
exit /b %err%
ENDLOCAL
