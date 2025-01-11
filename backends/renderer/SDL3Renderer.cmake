if (IMGUI_RENDERER_NAME STREQUAL "SDL3")

    if (NOT IMGUI_PLATFORM_NAME STREQUAL "SDL3")
        message(FATAL_ERROR "${IMGUI_RENDERER_NAME} renderer can only be used on SDL3 platforms")
    endif ()

    message(STATUS "[ImGui] Including renderer: ${IMGUI_RENDERER_NAME}")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_sdlrenderer3.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_sdlrenderer3.cpp)
endif ()