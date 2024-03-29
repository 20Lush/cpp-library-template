cmake_minimum_required(VERSION 3.22)

# Project version number. Good metadata to have, but ONLY INCREMENT WHEN THERE IS SOMETHING BEING RELEASED!
set(PROJECT_VERSION 1.0.0)

project(EXECUTABLE_REPOSITORY_NAME
    VERSION ${PROJECT_VERSION}
    DESCRIPTION "EXECUTABLE Repository"
)
message(STATUS "Repository name: " ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/runtime")

set(CMAKE_BOILERPLATE_PATH ${CMAKE_SOURCE_DIR}/.CMake-Boilerplate)
include(${CMAKE_BOILERPLATE_PATH}/INSTALLER.cmake)
include(${CMAKE_BOILERPLATE_PATH}/VARIABLES.cmake)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/cmake/")

add_compile_options(-Wall -Wextra -Wpedantic -Wformat-overflow=0)

if(CMAKE_BUILD_TYPE STREQUAL "DEBUG")
    set(CMAKE_CXX_FLAGS "--coverage")
    set(CMAKE_CXX_OUTPUT_EXTENSION_REPLACE ON)
    add_definitions(-DDEBUG)
endif()

if(${ENABLE_TESTING})
    enable_testing()
endif()

set(PACKAGE_HINTS ${CMAKE_IINSTALL_PREFIX})

add_subdirectory(executable)