project(widgets)

find_package(Qt5Widgets REQUIRED)

# Get all files
FILE(GLOB_RECURSE SOURCE_FILES CONFIGURE_DEPENDS "widgets/*.*")
# Remove _win files
list(FILTER SOURCE_FILES EXCLUDE REGEX "_win\..+$") # remove win files


# Rust library
SET(RUST_LIB "${CMAKE_CURRENT_SOURCE_DIR}/../rustexample/target/debug/librustexample.a")
# SET(RUST_LIB "target/debug/librustexample.a")

# Create Library
add_library(${PROJECT_NAME} STATIC ${SOURCE_FILES})
#add_dependencies(${PROJECT_NAME} ${git_watcher_target} ) # git check dependancy
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} )
# target_link_libraries(${PROJECT_NAME} PUBLIC Qt5::Widgets)
set_property(TARGET ${PROJECT_NAME} PROPERTY INTERFACE_LINK_LIBRARIES ${RUST_LIB})
target_link_libraries(${PROJECT_NAME} Qt5::Widgets core )

# Dirty workaround to handle no symbol warning in some static libraries
# @ref https://stackoverflow.com/a/33067038/1917249
set(CMAKE_C_ARCHIVE_FINISH   "<CMAKE_RANLIB> -no_warning_for_no_symbols -c <TARGET>")
set(CMAKE_CXX_ARCHIVE_FINISH "<CMAKE_RANLIB> -no_warning_for_no_symbols -c <TARGET>")

