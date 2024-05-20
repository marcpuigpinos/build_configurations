#!/bin/bash

# Project name
name="project"

# Check correct number of cmd arguments
if [ $# -ne 2 ]; then
    echo "Use: $0 <task> <conf>"
    exit 1
fi

# Save task and conf
task=$1
conf=$2

# Save current working directory
cwd=$(pwd)

# Check if tasks are correct
if [[ "$task" != "setup" && "$task" != "clean" && "$task" != "run" && "$task" != "compile" && "$task" != "delete" ]]; then
    echo "Error: task should be 'setup', 'clean', 'run', 'compile', or 'delete'"
    exit 1
fi

# Check if configurations are correct
if [[ "$conf" != "release" && "$conf" != "debug" ]]; then
    echo "Error: conf should be 'release' or 'debug'"
    exit 1
fi

# Logic to perform actions 
case $task in
    "setup")
        echo "Building project in $conf configuration..."
        # commands for each conf
        if [ "$conf" == "debug" ]; then
            meson setup --debug --warnlevel everything --werror debug
        else
            meson setup --buildtype release --optimization 3 --warnlevel everything --werror release
        fi
        ;;
    "compile")
        echo "Compiling the project in $conf configuration..."
        if [ "$conf" == "debug" ]; then
            meson compile -C debug
        else
            meson compile -C release
        fi
        ;;
    "clean")
        echo "Cleaning the project in $conf configuration..."
        if [ "$conf" == "debug" ]; then
            meson compile -C debug --clean
        else
            meson compile -C release --clean
        fi
        ;;
    "delete")
        echo "Delete the project in $conf configuration..."
        if [ "$conf" == "debug" ]; then
            rm -rf debug
        else
            rm -rf release
        fi       
        ;;
    "run")
        echo "Executing the project in $conf configuration..."
        if [ "$conf" == "debug" ]; then
            cd "$cwd/debug" && ./"$name"
            cd "$cwd"
        else
            cd "$cwd/release" && ./"$name"
            cd "$cwd"
        fi       
        ;;
esac

exit 0

