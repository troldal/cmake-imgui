cmake_minimum_required(VERSION 3.15)

##################################################################################################################
# PROJECT
##################################################################################################################

set(imgui_VERSION 1.91.6)

project(ImGui
        VERSION ${imgui_VERSION}
        LANGUAGES CXX
        DESCRIPTION "Build ImGui as shared or static library."
        HOMEPAGE_URL "https://github.com/ocornut/imgui"
)

include(FetchContent)
FetchContent_Declare(
        fetchimgui
        GIT_REPOSITORY https://github.com/ocornut/imgui.git
        GIT_TAG v${imgui_VERSION}
)
FetchContent_MakeAvailable(fetchimgui)

message(STATUS "[ImGui] Version: ${fetchimgui_SOURCE_DIR}")

set(IMGUI_SOURCE_DIR ${fetchimgui_SOURCE_DIR})
set(IMGUI_BACKENDS_DIR ${IMGUI_SOURCE_DIR}/backends)

##################################################################################################################
# TARGET OPTIONS
##################################################################################################################

option(IMGUI_STATIC_LIBRARY
        "Set to OFF to build as shared library."
        ON
)

##################################################################################################################
# TARGET
##################################################################################################################

if (IMGUI_STATIC_LIBRARY)
    message(STATUS "[ImGui] Building STATIC library")
    add_library(${PROJECT_NAME} STATIC "")
else ()
    message(STATUS "[ImGui] Building SHARED library")
    add_library(${PROJECT_NAME} SHARED "")
endif ()
add_library(ImGui::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

##################################################################################################################
# BACKEND OPTIONS
##################################################################################################################

option(IMGUI_BACKEND_ALLEGRO5
        "Set to ON to include Allegro5 backend files."
        OFF
)

option(IMGUI_BACKEND_ANDROID
        "Set to ON to include Android backend files."
        OFF
)

option(IMGUI_BACKEND_DX9
        "Set to ON to include DX9 backend files."
        OFF
)

option(IMGUI_BACKEND_DX10
        "Set to ON to include DX10 backend files."
        OFF
)

option(IMGUI_BACKEND_DX11
        "Set to ON to include DX11 backend files."
        OFF
)

option(IMGUI_BACKEND_DX12
        "Set to ON to include DX12 backend files."
        OFF
)

option(IMGUI_BACKEND_GLFW
        "Set to ON to include GLFW backend files."
        OFF
)

option(IMGUI_BACKEND_GLUT
        "Set to ON to include GLUT backend files."
        OFF
)

option(IMGUI_BACKEND_METAL
        "Set to ON to include Metal backend files."
        OFF
)

option(IMGUI_BACKEND_OPENGL2
        "Set to ON to include OpenGL2 backend files."
        OFF
)

option(IMGUI_BACKEND_OPENGL3
        "Set to ON to include OpenGL3 backend files."
        OFF
)

option(IMGUI_BACKEND_OSX
        "Set to ON to include OSX backend files."
        OFF
)

option(IMGUI_BACKEND_SDL2
        "Set to ON to include SDL2 backend files."
        OFF
)

option(IMGUI_BACKEND_SDLRENDERER2
        "Set to ON to include SDL2 Renderer backend files."
        OFF
)

option(IMGUI_BACKEND_SDL3
        "Set to ON to include SDL3 backend files."
        OFF
)

option(IMGUI_BACKEND_SDLRENDERER3
        "Set to ON to include SDL3 Renderer backend files."
        OFF
)

option(IMGUI_BACKEND_VULKAN
        "Set to ON to include Vulcan backend files."
        OFF
)

option(IMGUI_BACKEND_WGPU
        "Set to ON to include WGPU backend files."
        OFF
)

option(IMGUI_BACKEND_WIN32
        "Set to ON to include Win32 backend files."
        OFF
)


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

set(IMGUI_INTERFACE_LIBS "")



if (IMGUI_BACKEND_ALLEGRO5)
    message(STATUS "[ImGui] Including backend platform: [Allegro5]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_allegro5.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_allegro5.cpp)
endif ()

if (IMGUI_BACKEND_ANDROID)
    message(STATUS "[ImGui] Including backend platform: [Android]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_android.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_android.cpp)
endif ()

if (IMGUI_BACKEND_DX9)
    message(STATUS "[ImGui] Including backend api: [Direct3D9]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_dx9.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_dx9.cpp)
    list(APPEND IMGUI_INTERFACE_LIBS d3d9)
endif ()

if (IMGUI_BACKEND_DX10)
    message(STATUS "[ImGui] Including backend api: [Direct3D10]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_dx10.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_dx10.cpp)
    list(APPEND IMGUI_INTERFACE_LIBS d3d10)
endif ()

if (IMGUI_BACKEND_DX11)
    message(STATUS "[ImGui] Including backend api: [Direct3D11]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_dx11.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_dx11.cpp)
    list(APPEND IMGUI_INTERFACE_LIBS d3d11)
endif ()

if (IMGUI_BACKEND_DX12)
    message(STATUS "[ImGui] Including backend api: [Direct3D12]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_dx12.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_dx12.cpp)
    list(APPEND IMGUI_INTERFACE_LIBS d3d12)
    list(APPEND IMGUI_INTERFACE_LIBS dxgi)
    # list(APPEND IMGUI_INTERFACE_LIBS d3dcompiler)
endif ()



if (IMGUI_BACKEND_GLFW)
    message(STATUS "[ImGui] Including backend platform: [GLFW]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_glfw.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_glfw.cpp)
    if (EMSCRIPTEN)
#        target_link_options(${PROJECT_NAME} PUBLIC -sUSE_GLFW=3 -sWASM=1 -sALLOW_MEMORY_GROWTH=1 -sNO_EXIT_RUNTIME=0 -sASSERTIONS=1)
        target_link_options(${PROJECT_NAME} PUBLIC --use-port=contrib.glfw3 -sWASM=1 -sALLOW_MEMORY_GROWTH=1 -sNO_EXIT_RUNTIME=0 -sASSERTIONS=1)
        target_link_options(${PROJECT_NAME} PUBLIC --shell-file ${fetchimgui_SOURCE_DIR}/examples/libs/emscripten/shell_minimal.html)
        #target_link_options(${PROJECT_NAME} PUBLIC --preload-file ${CMAKE_CURRENT_BINARY_DIR}/fonts/Inter.ttf)
    else()
        find_package(glfw3 CONFIG REQUIRED)
        target_link_libraries(${PROJECT_NAME} PUBLIC glfw)
        #list(APPEND IMGUI_INTERFACE_LIBS glfw)
    endif ()

endif ()

if (IMGUI_BACKEND_GLUT)
    message(STATUS "[ImGui] Including backend platform: [GLUT]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_glut.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_glut.cpp)
endif ()

if (IMGUI_BACKEND_METAL)
    message(STATUS "[ImGui] Including backend platform: [METAL]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_metal.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_metal.mm)
endif ()

if (IMGUI_BACKEND_OPENGL2)
    message(STATUS "[ImGui] Including backend api: [OpenGL2]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_opengl2.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_opengl2.cpp)
    if (EMSCRIPTEN)
        #target_link_options(${PROJECT_NAME} PUBLIC -sUSE_GLFW=3 -sWASM=1 -sALLOW_MEMORY_GROWTH=1 -sNO_EXIT_RUNTIME=0 -sASSERTIONS=1)
        #target_link_options(${PROJECT_NAME} PUBLIC --shell-file ${CMAKE_CURRENT_LIST_DIR}/libs/emscripten/shell_minimal.html)
        #target_link_libraries(${PROJECT_NAME} PUBLIC  glfw)
    else()
        find_package(OpenGL REQUIRED)
        target_link_libraries(${PROJECT_NAME} PUBLIC OpenGL::GL)
        #list(APPEND IMGUI_INTERFACE_LIBS OpenGL::GL)
    endif ()

endif ()

if (IMGUI_BACKEND_OPENGL3)
    message(STATUS "[ImGui] Including backend api: [OpenGL3]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_opengl3.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_opengl3.cpp)
    if (EMSCRIPTEN)
        #target_link_options(${PROJECT_NAME} PUBLIC -sUSE_GLFW=3 -sWASM=1 -sALLOW_MEMORY_GROWTH=1 -sNO_EXIT_RUNTIME=0 -sASSERTIONS=1)
        #target_link_options(${PROJECT_NAME} PUBLIC --shell-file ${CMAKE_CURRENT_LIST_DIR}/libs/emscripten/shell_minimal.html)
        #target_link_libraries(${PROJECT_NAME} PUBLIC  glfw)
    else()
        find_package(OpenGL REQUIRED)
        target_link_libraries(${PROJECT_NAME} PUBLIC OpenGL::GL)
        #list(APPEND IMGUI_INTERFACE_LIBS OpenGL::GL)
    endif ()

endif ()

if (IMGUI_BACKEND_OSX)
    message(STATUS "[ImGui] Including backend platform: [OSX]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_osx.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_osx.mm)
endif ()

if (IMGUI_BACKEND_SDL2)
    message(STATUS "[ImGui] Including backend platform: [SDL2]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_sdl2.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_sdl2.cpp)
    if (EMSCRIPTEN)
        target_link_options(${PROJECT_NAME} PUBLIC -sUSE_SDL=2 -sWASM=1 -sALLOW_MEMORY_GROWTH=1 -sNO_EXIT_RUNTIME=0 -sASSERTIONS=1)
        target_link_options(${PROJECT_NAME} PUBLIC --shell-file ${fetchimgui_SOURCE_DIR}/examples/libs/emscripten/shell_minimal.html)
    else()
        find_package(SDL2 CONFIG REQUIRED)
        list(APPEND IMGUI_INTERFACE_LIBS SDL2::SDL2)
        target_link_libraries(${PROJECT_NAME}
                PUBLIC
                SDL2::SDL2main
                $<IF:$<TARGET_EXISTS:SDL2::SDL2>,SDL2::SDL2,SDL2::SDL2-static>
        )
    endif ()

endif ()

if (IMGUI_BACKEND_SDLRENDERER2)
    message(STATUS "[ImGui] Including backend platform: [SDL2 Renderer]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_sdlrenderer2.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_sdlrenderer2.cpp)
    if (EMSCRIPTEN)
        target_link_options(${PROJECT_NAME} PUBLIC -sUSE_SDL=2 -sWASM=1 -sALLOW_MEMORY_GROWTH=1 -sNO_EXIT_RUNTIME=0 -sASSERTIONS=1)
        target_link_options(${PROJECT_NAME} PUBLIC --shell-file ${fetchimgui_SOURCE_DIR}/examples/libs/emscripten/shell_minimal.html)
    else()
        find_package(SDL2 CONFIG REQUIRED)
        list(APPEND IMGUI_INTERFACE_LIBS SDL2::SDL2)
        target_link_libraries(${PROJECT_NAME}
                PUBLIC
                SDL2::SDL2main
                $<IF:$<TARGET_EXISTS:SDL2::SDL2>,SDL2::SDL2,SDL2::SDL2-static>
        )
    endif ()

endif ()

if (IMGUI_BACKEND_SDL3)
    message(STATUS "[ImGui] Including backend platform: [SDL3]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_sdl3.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_sdl3.cpp)
endif ()

if (IMGUI_BACKEND_SDLRENDERER3)
    message(STATUS "[ImGui] Including backend platform: [SDL3 Renderer]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_sdlrenderer3.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_sdlrenderer3.cpp)
endif ()

if (IMGUI_BACKEND_VULKAN)
    message(STATUS "[ImGui] Including backend platform: [Vulkan]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_vulkan.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_vulkan.cpp)
endif ()

if (IMGUI_BACKEND_WGPU)
    message(STATUS "[ImGui] Including backend platform: [WGPU]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_wgpu.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_wgpu.cpp)
endif ()

if (IMGUI_BACKEND_WIN32)
    message(STATUS "[ImGui] Including backend platform: [WIN32]")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_win32.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_win32.cpp)
endif ()


set(IMGUI_PROJECT_FILES
#        ${IMGUI_PUBLIC_H_FILES}
        ${IMGUI_PUBLIC_CXX_FILES}
#        ${IMGUI_FONTS_FILES}
)

##################################################################################################################
# TARGET
##################################################################################################################

#if (IMGUI_STATIC_LIBRARY)
#    message(STATUS "[ImGui] Building STATIC library")
#    add_library(${PROJECT_NAME} STATIC ${IMGUI_PROJECT_FILES})
#else ()
#    message(STATUS "[ImGui] Building SHARED library")
#    add_library(${PROJECT_NAME} SHARED ${IMGUI_PROJECT_FILES})
#endif ()
#add_library(ImGui::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

target_sources(${PROJECT_NAME}
        PRIVATE
        ${IMGUI_PROJECT_FILES}
)

target_include_directories(${PROJECT_NAME}
        PUBLIC
        $<BUILD_INTERFACE:${IMGUI_SOURCE_DIR}>
        $<BUILD_INTERFACE:${IMGUI_BACKENDS_DIR}>
        $<INSTALL_INTERFACE:include> # ${CMAKE_INSTALL_PREFIX}/include
)

if (EMSCRIPTEN)
    target_include_directories(${PROJECT_NAME} PUBLIC ${fetchimgui_SOURCE_DIR}/examples/libs/emscripten)
endif()

target_link_libraries(${PROJECT_NAME} INTERFACE ${IMGUI_INTERFACE_LIBS})

if (IMGUI_BACKEND_DX12)
    target_link_libraries(${PROJECT_NAME} PRIVATE d3d12 dxgi)
    target_compile_definitions(${PROJECT_NAME} PRIVATE ImTextureID=ImU64)
endif ()



target_compile_options(${PROJECT_NAME}
        PUBLIC
        $<$<CXX_COMPILER_ID:MSVC>:$<$<CONFIG:Debug>:/MTd>>
        $<$<CXX_COMPILER_ID:MSVC>:$<$<CONFIG:MinSizeRel>:/MT>>
        $<$<CXX_COMPILER_ID:MSVC>:$<$<CONFIG:Release>:/MT>>
        $<$<CXX_COMPILER_ID:MSVC>:$<$<CONFIG:RelWithDebInfo>:/MTd>>
)

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
