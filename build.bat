IF NOT DEFINED 1 (
	SET buildType=Debug
) ELSE (
	SET buildType=%1
)

REM Build
conan install . -s build_type=%buildType% -s arch=x86_64 -s compiler.runtime=MTd --build=missing
MKDIR build
CD build
cmake -G "Visual Studio 15 2017 Win64" .. -DCMAKE_BUILD_TYPE=%buildType%
cmake --build . --config %buildType%
CD ..

REM Prepare package
MKDIR bin
COPY whip.cfg.sample bin
COPY build\bin\whip.exe bin
