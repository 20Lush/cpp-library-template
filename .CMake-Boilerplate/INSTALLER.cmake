function(GenerateMetaData PROJECT_NAME)

    install(EXPORT ${PROJECT_NAME}-targets
            FILE "${PROJECT_NAME}-targets.cmake"
            DESTINATION share/cmake/${PROJECT_NAME}
        )
    
    configure_file("${CMAKE_CURRENT_FUNCTION_LIST_DIR}/project-config.cmake"
        ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}"/cmake/"${PROJECT_NAME}"-config-version.cmake"
        @ONLY
    )

    include(CMakePackageConfigHelpers)
    write_basic_package_version_file(
        ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}"/cmake/"${PROJECT_NAME}"-config-version.cmake"
    )

    install(
        FILES
            ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}"/cmake/"${PROJECT_NAME}"-config.cmake"
            ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}"/cmake/"${PROJECT_NAME}"-config-version.cmake"
        DESTINATION
            "share/cmake/"${PROJECT_NAME}
    )

endfunction(GenerateMetaData)

function(InstallSetup PROJECT_NAME)   
    
    include(GNUInstallDirs)

    if(NOT CMAKE_BUILD_TYPE)
        set(CMAKE_BUILD_TYPE DEBUG)
    endif()

    GenerateMetaData(${PROJECT_NAME})

endfunction(InstallSetup)

function(DefaultInstall PROJECT_NAME)

    InstallSetup(${PROJECT_NAME})

    install(TARGETS ${PROJECT_NAME} EXPORT ${PROJECT_NAME}-target_sources
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
    )

endfunction(DefaultInstall)