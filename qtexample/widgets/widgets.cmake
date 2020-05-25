project(widgets)

find_package(Qt5Widgets REQUIRED)

# Get all files
FILE(GLOB_RECURSE SOURCE_FILES CONFIGURE_DEPENDS "widgets/*.*")

# Create Library
add_library(${PROJECT_NAME} STATIC ${SOURCE_FILES})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} )
target_link_libraries(${PROJECT_NAME} Qt5::Widgets core )
