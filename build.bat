@ECHO OFF

REM Build
MKDIR build
CD build
cmake ..
cmake --build .
CD ..

REM Prepare package
MKDIR bin
COPY whip.cfg.sample bin
COPY build\whip bin
