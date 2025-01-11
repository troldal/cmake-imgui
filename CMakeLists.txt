cmake_minimum_required(VERSION 3.15)

##################################################################################################################
# PROJECT
##################################################################################################################
set(IMGUI_PLATFORMS "ANDROID" "GLFW" "GLUT" "MACOS" "SDL2" "SDL3" "WIN32")
set(IMGUI_RENDERERS "DX9" "DX10" "DX11" "DX12" "METAL" "OPENGL2" "OPENGL3" "SDL2" "SDL3" "VULKAN" "WEBGPU")

set(IMGUI_VERSION_TAG "master" CACHE STRING "ImGui version tag (e.g. 'master' or 'v1.96.6')")
set(IMGUI_PLATFORM_NAME "GLFW" CACHE STRING "ImGui platform type (default is 'GLFW')")
set(IMGUI_RENDERER_NAME "OPENGL3" CACHE STRING "ImGui renderer type (default is 'OPENGL3')")
set(IMGUI_BUILD_TYPE "STATIC" CACHE STRING "ImGui build type (default is 'STATIC')")

string(TOLOWER ${IMGUI_VERSION_TAG} IMGUI_VERSION_TAG)
string(TOUPPER ${IMGUI_PLATFORM_NAME} IMGUI_PLATFORM_NAME)
string(TOUPPER ${IMGUI_RENDERER_NAME} IMGUI_RENDERER_NAME)
string(TOUPPER ${IMGUI_BUILD_TYPE} IMGUI_BUILD_TYPE)

if (NOT ${IMGUI_PLATFORM_NAME} IN_LIST IMGUI_PLATFORMS)
    message(FATAL_ERROR "Invalid ImGui platform name: ${IMGUI_PLATFORM_NAME}")
endif ()

if (NOT ${IMGUI_RENDERER_NAME} IN_LIST IMGUI_RENDERERS)
    message(FATAL_ERROR "Invalid ImGui renderer name: ${IMGUI_RENDERER_NAME}")
endif ()

project(ImGui
        LANGUAGES CXX
        DESCRIPTION "Build ImGui as shared or static library."
        HOMEPAGE_URL "https://github.com/ocornut/imgui"
)

if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug CACHE STRING "" FORCE)
endif ()

include(FetchContent)
FetchContent_Declare(
        fetchimgui
        GIT_REPOSITORY https://github.com/ocornut/imgui.git
        GIT_TAG ${IMGUI_VERSION_TAG}
)
FetchContent_MakeAvailable(fetchimgui)

message(STATUS "[ImGui] Version: ${fetchimgui_SOURCE_DIR}")

set(IMGUI_SOURCE_DIR ${fetchimgui_SOURCE_DIR})
set(IMGUI_BACKENDS_DIR ${IMGUI_SOURCE_DIR}/backends)

##################################################################################################################
# TARGET OPTIONS
##################################################################################################################

set(IMGUI_STATIC_LIBRARY "")
if (IMGUI_BUILD_TYPE STREQUAL "STATIC")
    set(IMGUI_STATIC_LIBRARY ON)
elseif (IMGUI_BUILD_TYPE STREQUAL "SHARED")
    set(IMGUI_STATIC_LIBRARY OFF)
else ()
    message(FATAL_ERROR "Invalid ImGui build type: ${IMGUI_BUILD_TYPE}")
endif ()

##################################################################################################################
# TARGET
##################################################################################################################

message(STATUS "[ImGui] Building ${IMGUI_BUILD_TYPE} library")
if (IMGUI_STATIC_LIBRARY)
    add_library(${PROJECT_NAME} STATIC "")
else ()
    add_library(${PROJECT_NAME} SHARED "")
endif ()
add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})



##################################################################################################################
# SOURCES
##################################################################################################################

set(IMGUI_PUBLIC_H_FILES
        ${IMGUI_SOURCE_DIR}/imgui.h
        ${IMGUI_SOURCE_DIR}/imconfig.h
        ${IMGUI_SOURCE_DIR}/imgui_internal.h
        ${IMGUI_SOURCE_DIR}/imstb_rectpack.h
        ${IMGUI_SOURCE_DIR}/imstb_textedit.h
        ${IMGUI_SOURCE_DIR}/imstb_truetype.h
)

set(IMGUI_PUBLIC_CXX_FILES
        ${IMGUI_SOURCE_DIR}/imgui.cpp
        ${IMGUI_SOURCE_DIR}/imgui_draw.cpp
        ${IMGUI_SOURCE_DIR}/imgui_widgets.cpp
        ${IMGUI_SOURCE_DIR}/imgui_demo.cpp
        ${IMGUI_SOURCE_DIR}/imgui_tables.cpp
)

set(IMGUI_EXTERNAL_LIBS "")
set(IMGUI_COMPILE_OPTIONS "")
set(IMGUI_LINK_OPTIONS "")
include(backends/Backends.cmake)

##################################################################################################################
# TARGET
##################################################################################################################

target_sources(${PROJECT_NAME}
        PRIVATE
        ${IMGUI_PUBLIC_CXX_FILES}
)

target_include_directories(${PROJECT_NAME}
        PUBLIC
        $<BUILD_INTERFACE:${IMGUI_SOURCE_DIR}>
        $<BUILD_INTERFACE:${IMGUI_BACKENDS_DIR}>
        $<BUILD_INTERFACE:${fetchimgui_SOURCE_DIR}/examples/libs/emscripten>
)

target_compile_options(${PROJECT_NAME} PUBLIC ${IMGUI_COMPILE_OPTIONS})
target_link_options(${PROJECT_NAME} PUBLIC ${IMGUI_LINK_OPTIONS})
target_link_libraries(${PROJECT_NAME} PUBLIC ${IMGUI_EXTERNAL_LIBS})

if (MSVC)
    if (IMGUI_STATIC_LIBRARY)
        set_property(TARGET ${PROJECT_NAME} PROPERTY WINDOWS_EXPORT_ALL_SYMBOLS OFF)
    else ()
        set_property(TARGET ${PROJECT_NAME} PROPERTY WINDOWS_EXPORT_ALL_SYMBOLS ON)
    endif ()
endif ()

set_target_properties(${PROJECT_NAME} PROPERTIES
        DEBUG_POSTFIX "${STATIC_POSTFIX}d"
        RELEASE_POSTFIX "${STATIC_POSTFIX}"
        MINSIZEREL_POSTFIX "${STATIC_POSTFIX}mr"
        RELWITHDEBINFO_POSTFIX "${STATIC_POSTFIX}rd"
)
