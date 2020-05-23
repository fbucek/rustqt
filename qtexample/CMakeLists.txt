cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

# Project name is used for target
project(QtExample)

#
# Qt and c++ options
#
# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR OFF)
# Instruct CMake to run moc automatically when needed
set(CMAKE_AUTOMOC ON)
# Create code from a list of Qt designer ui files
set(CMAKE_AUTOUIC ON)
# Create qrc automatically
set(CMAKE_AUTORCC ON)
# c++17
set(CMAKE_CXX_STANDARD 17)

#-----------------------------------------------------------------------------
# Enable ccache if not already enabled by symlink masquerading and if no other
# CMake compiler launchers are already defined
# @see https://stackoverflow.com/a/34317588/1917249
#-----------------------------------------------------------------------------
find_program(CCACHE_EXECUTABLE ccache)
mark_as_advanced(CCACHE_EXECUTABLE)
if(CCACHE_EXECUTABLE)
    foreach(LANG C CXX)
        if(NOT DEFINED CMAKE_${LANG}_COMPILER_LAUNCHER AND NOT CMAKE_${LANG}_COMPILER MATCHES ".*/ccache$")
            message(STATUS "Enabling ccache for ${LANG}")
            set(CMAKE_${LANG}_COMPILER_LAUNCHER ${CCACHE_EXECUTABLE} CACHE STRING "")
            # @see https://crascit.com/2016/04/09/using-ccache-with-cmake/
            set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${CCACHE_EXECUTABLE}")
        endif()
    endforeach()
endif()

include (app/app.cmake)
include (core/core.cmake)
include (widgets/widgets.cmake)
