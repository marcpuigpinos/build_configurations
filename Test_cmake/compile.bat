
@echo off
REM Check if an argument is provided
if "%1"=="" (
    echo Please specify "debug" or "release".
    exit /b 1
)

REM Set the build type based on the argument
if "%1"=="debug" (
    echo Configuring for Debug build...
    cmake --preset=gcc-debug
    cd build\debug
    echo Building Debug...
    make
    exit /b 0
)

if "%1"=="release" (
    echo Configuring for Release build...
    cmake --preset=gcc-release
    cd build\release
    echo Building Release...
    make
    exit /b 0
)

REM If the argument is not recognized
echo Invalid argument: "%1"
echo Please specify either "debug" or "release".
exit /b 1
