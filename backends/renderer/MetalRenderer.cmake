if (IMGUI_RENDERER_NAME STREQUAL "METAL")

    if (NOT APPLE)
        message(FATAL_ERROR "${IMGUI_RENDERER_NAME} renderer can only be used on Apple platforms")
    endif ()

    if (NOT IMGUI_PLATFORM_NAME STREQUAL "MACOS" OR NOT IMGUI_PLATFORM_NAME STREQUAL "GLFW")
        message(FATAL_ERROR "${IMGUI_RENDERER_NAME} renderer can only be used on macOS platform or using GLFW")
    endif ()

    if (EMSCRIPTEN)
        message(FATAL_ERROR "${IMGUI_RENDERER_NAME} renderer can't be used with Emscripten")
    endif ()


    message(STATUS "[ImGui] Including renderer: ${IMGUI_RENDERER_NAME}")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_metal.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_metal.mm)
endif ()