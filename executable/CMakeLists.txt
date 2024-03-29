cmake_minimum_required(VERSION 3.22)

project(EXECUTABLE_NAME
    VERSION ${PROJECT_VERSION}
    DESCRIPTION "EXECUTABLE Project"
)
message(STATUS "Project name: " ${PROJECT_NAME})

set(SOURCE_FILES
    src/main.cpp
)

set(PUBLIC_INCLUDE_FILES
    include/main.hpp
)

add_executable( ${PROJECT_NAME}
    ${SOURCE_FILES}
)

include_directories("${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_INCLUDEDIR}")

# The installed directory is going to have its own include directory.
# In the unlikely scenario this executable is used in another project,
# they'll need the public headers.
target_include_directories(${PROJECT_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

target_compile_features(${PROJECT_NAME}
    PUBLIC
        cxx_std_20
)

set_target_properties(${PROJECT_NAME}
    PROPERTIES
        LINKER_LANGUAGE CXX
        POSITION_INDEPENDENT_CODE TRUE
)

target_link_libraries(${PROJECT_NAME}
    PUBLIC
        # any dependency library we are linking...
)

message(STATUS "Installing executable to " ${CMAKE_INSTALL_PREFIX} "/...")
# Found in INSTALLER.cmake
DefaultInstall(${PROJECT_NAME})