cmake_minimum_required(VERSION 3.6)

PROJECT(whip CXX)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)
set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_COLOR_MAKEFILE ON)

add_subdirectory(cmake)
include(PrecompiledHeader)
include(ucm)

include_directories("ooid")

IF (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING
	"Build type. One of: Debug Release RelWithDebInfo" FORCE)
ENDIF(NOT CMAKE_BUILD_TYPE)

set(CMAKE_CXX_STANDARD 14)

include(conanbuildinfo.cmake)
conan_basic_setup()

ucm_set_runtime(STATIC)

find_package(Threads REQUIRED)

set(Whip_SRCS
	whip/AppLog.cpp
	whip/Asset.cpp
	whip/AssetCache.cpp
	whip/AssetClient.cpp
	whip/AssetSearch.cpp
	whip/AssetServer.cpp
	whip/AssetStorageError.cpp
	whip/AuthChallengeMsg.cpp
	whip/AuthResponseMsg.cpp
	whip/AuthStatusMsg.cpp
	whip/ClientRequestMsg.cpp
	whip/CSAuthenticated.cpp
	whip/CSUnauthenticated.cpp
	whip/DatabaseSet.cpp
	whip/DataFile.cpp
	whip/EndOfFileError.cpp
	whip/ExistenceIndex.cpp
	whip/IAsyncStorageBackend.cpp
	whip/IConnectionState.cpp
	whip/IDataFile.cpp
	whip/IIndexFileImplementation.cpp
	whip/IIndexFileManager.cpp
	whip/IndexFile.cpp
	whip/IndexFileError.cpp
	whip/IntraMeshMsg.cpp
	whip/IntraMeshQueryClient.cpp
	whip/IntraMeshService.cpp
	whip/IStorageBackend.cpp
	whip/MeshQueryConnection.cpp
	whip/MeshServer.cpp
	whip/MeshStorageBackend.cpp
	whip/PosixDataFileImpl.cpp
	whip/PullReplicationService.cpp
	whip/PushReplicationService.cpp
	whip/Random.cpp
	whip/RemoteAssetService.cpp
	whip/RequestError.cpp
	whip/ServerResponseMsg.cpp
	whip/Settings.cpp
	whip/SHA1.cpp
	whip/SQLiteConnection.cpp
	whip/SQLiteError.cpp
	whip/SQLiteIndexFile.cpp
	whip/SQLiteIndexFileManager.cpp
	whip/SQLiteTransaction.cpp
	whip/Validator.cpp
	whip/VFSBackend.cpp
	whip/VFSDatabase.cpp
	whip/VFSQueueTypes.cpp
	whip/whip.cpp
	whip/WinDataFileImpl.cpp
	whip/MovingAverage.cpp
)

add_executable(whip 
    ${Whip_SRCS}
    )
target_link_libraries(whip 
    ${CMAKE_THREAD_LIBS_INIT}
	${CMAKE_DL_LIBS}
    ${CONAN_LIBS}
	${LIBS}
    )

IF (WIN32)
	SET_PROPERTY(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT whip)
ENDIF(WIN32)
