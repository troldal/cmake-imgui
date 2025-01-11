if (IMGUI_RENDERER_NAME STREQUAL "OPENGL3")

    if (
            NOT IMGUI_PLATFORM_NAME STREQUAL "ANDROID" AND
            NOT IMGUI_PLATFORM_NAME STREQUAL "GLFW" AND
            NOT IMGUI_PLATFORM_NAME STREQUAL "SDL2" AND
            NOT IMGUI_PLATFORM_NAME STREQUAL "SDL3" AND
            NOT IMGUI_PLATFORM_NAME STREQUAL "WIN32")
        message(FATAL_ERROR "${IMGUI_RENDERER_NAME} renderer can only be used on ANDROID, GLFW, SDL2, SDL3 or WIN32 platforms")
    endif ()

    message(STATUS "[ImGui] Including renderer: ${IMGUI_RENDERER_NAME}")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_opengl3.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_opengl3.cpp)
    if (EMSCRIPTEN)
        message(STATUS "[ImGui] Using ${IMGUI_RENDERER_NAME} for Emscripten")
    else ()
        message(STATUS "[ImGui] Using ${IMGUI_RENDERER_NAME} for Desktop")
        find_package(OpenGL REQUIRED)
        list(APPEND IMGUI_EXTERNAL_LIBS OpenGL::GL)
    endif ()
endif ()