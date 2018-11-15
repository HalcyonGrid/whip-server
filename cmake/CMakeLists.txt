# -*- cmake -*-

SET(cmake_SOURCE_FILES
    CMakeLists.txt
	
    PrecompiledHeader.cmake
	ucm.cmake
	)
SOURCE_GROUP("Shared Rules" FILES ${cmake_SOURCE_FILES})

SET(master_SOURCE_FILES ../CMakeLists.txt )
SOURCE_GROUP("Master Rules" FILES ${master_SOURCE_FILES})

SET_SOURCE_FILES_PROPERTIES(${cmake_SOURCE_FILES} ${master_SOURCE_FILES}
							PROPERTIES HEADER_FILE_ONLY TRUE)

ADD_LIBRARY(cmake
	cmake_dummy.cpp
	${cmake_SOURCE_FILES}
	${master_SOURCE_FILES}
	)
