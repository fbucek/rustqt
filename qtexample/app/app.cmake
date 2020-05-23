project(QtExample VERSION 0.1.0)

# Get all files
FILE(GLOB_RECURSE SOURCE_FILES CONFIGURE_DEPENDS "app/*.*")

# Executable
# info.plist is generated from /cmake folder with .in file
add_executable(${PROJECT_NAME} MACOSX_BUNDLE ${SOURCE_FILES} )
target_link_libraries(${PROJECT_NAME} PUBLIC widgets )
# Relative location to Framework and libraries
# - this is valid for MacOS Bunde
set_target_properties(${PROJECT_NAME} PROPERTIES INSTALL_RPATH
    "@loader_path/../Frameworks;@loader_path/../lib")
set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD 11
    CXX_STANDARD_REQUIRED ON
)



if (APPLE)
    # install ICON into Resource folder
    set_source_files_properties(${INV_ICON} PROPERTIES MACOSX_PACKAGE_LOCATION Resources)

    #
    # Modify info.plist
    #
    set(MACOSX_BUNDLE_GUI_IDENTIFIER "org.company.${PROJECT_NAME}")
    set(MACOSX_BUNDLE_COPYRIGHT "Copyright (c) 2020 Company. All rights reserved.")
    set(MACOSX_BUNDLE_BUNDLE_NAME ${PROJECT_NAME})
    set(MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION})
    set(MACOSX_BUNDLE_LONG_VERSION_STRING ${PROJECT_VERSION})
    set(MACOSX_BUNDLE_SHORT_VERSION_STRING "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}")
    set(MACOSX_BUNDLE_ICON_FILE ${INV_ICONNAME}) # correct name to icon
endif()

#
# Install
#
install(TARGETS ${PROJECT_NAME} DESTINATION ${PROJECT_NAME} )
