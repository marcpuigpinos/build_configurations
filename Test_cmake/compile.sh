#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Please specify 'debug' or 'release'."
    exit 1
fi

# Set the build type based on the argument
if [ "$1" == "debug" ]; then
    echo "Configuring for Debug build..."
    cmake --preset=gcc-debug
    echo "Building Debug..."
    cmake --build build/debug
    exit 0
fi

if [ "$1" == "release" ]; then
    echo "Configuring for Release build..."
    cmake --preset=gcc-release
    echo "Building Release..."
    cmake --build build/release
    exit 0
fi

# If the argument is not recognized
echo "Invalid argument: '$1'"
echo "Please specify either 'debug' or 'release'."
exit 1
