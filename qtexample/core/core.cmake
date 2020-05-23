project(core)

## Qt Libraries
find_package(Qt5Core CONFIG REQUIRED)

# Get all files
FILE(GLOB_RECURSE SOURCE_FILES CONFIGURE_DEPENDS "core/*.*")
# Remove Windows files
list(FILTER SOURCE_FILES EXCLUDE REGEX "_win\..+$") # remove win files

# Create Library
add_library(${PROJECT_NAME} STATIC ${SOURCE_FILES})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} )
target_link_libraries(${PROJECT_NAME} PUBLIC Qt5::Core)
