#!/bin/bash

CC=g++
DF="-g -Wall -O0"
RF="-Wall -O3"

# Verificamos que se pasen los argumentos necesarios
if [ $# -ne 2 ]; then
    echo "Uso: $0 <task> <conf>"
    exit 1
fi

# Guardamos los argumentos en variables
task=$1
conf=$2

# Verificamos que task y conf tengan valores válidos
if [[ "$task" != "build" && "$task" != "clean" && "$task" != "run" ]]; then
    echo "Error: task debe ser 'build', 'clean', o 'run'"
    exit 1
fi

if [[ "$conf" != "release" && "$conf" != "debug" ]]; then
    echo "Error: conf debe ser 'release' o 'debug'"
    exit 1
fi

# Lógica para realizar las acciones según los argumentos
case $task in
    "build")
        echo "Realizando la construcción en modo $conf..."
        # Aquí pondrías los comandos para construir el proyecto
        if [ "$conf" == "debug" ]; then
            mkdir -p debug
            $CC $DF main.cpp -o debug/main
        else
            mkdir -p release
            $CC $RF main.cpp -o release/main
        fi
        ;;
    "clean")
        echo "Limpiando el proyecto en modo $conf..."
        # Aquí pondrías los comandos para limpiar el proyecto
        if [ "$conf" == "debug" ]; then
            rm -rf debug
        else
            rm -rf release
        fi       
        ;;
    "run")
        echo "Ejecutando el proyecto en modo $conf..."
        # Aquí pondrías los comandos para ejecutar el proyecto
        if [ "$conf" == "debug" ]; then
            debug/main
        else
            release/main
        fi       
        ;;
esac

exit 0

