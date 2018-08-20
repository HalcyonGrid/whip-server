#!/bin/bash

buildType="$1"
if [ "x$1" == "x" ]; then
	buildType="Debug"
fi

# Build
conan install . -s build_type=$buildType -s arch=x86_64 --build=missing
mkdir build 2>/dev/null
cd build
cmake .. -DCMAKE_BUILD_TYPE=$buildType
cmake --build .
cd ..

# Prepare package
mkdir bin 2>/dev/null
cp whip.cfg.sample bin/
cp build/whip bin/
