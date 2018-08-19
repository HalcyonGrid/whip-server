#!/bin/bash

# Build
mkdir build 2>/dev/null
cd build
cmake ..
cmake --build .
cd ..

# Prepare package
mkdir bin 2>/dev/null
cp whip.cfg.sample bin/
cp build/whip bin/
