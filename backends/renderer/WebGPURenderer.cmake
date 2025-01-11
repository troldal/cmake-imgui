if (IMGUI_RENDERER_NAME STREQUAL "WEBGPU")

    if (NOT IMGUI_PLATFORM_NAME STREQUAL "GLFW")
        message(FATAL_ERROR "${IMGUI_RENDERER_NAME} renderer can only be used with GLFW")
    endif ()

message(STATUS "[ImGui] Including renderer: ${IMGUI_RENDERER_NAME}")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_wgpu.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_wgpu.cpp)
endif()