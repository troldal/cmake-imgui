if (IMGUI_RENDERER_NAME STREQUAL "VULKAN")

    if (
            NOT IMGUI_PLATFORM_NAME STREQUAL "GLFW" AND
            NOT IMGUI_PLATFORM_NAME STREQUAL "SDL2" AND
            NOT IMGUI_PLATFORM_NAME STREQUAL "SDL3")
        message(FATAL_ERROR "${IMGUI_RENDERER_NAME} renderer can only be used on GLFW, SDL2 or SDL3 platforms")
    endif ()

    message(STATUS "[ImGui] Including renderer: ${IMGUI_RENDERER_NAME}")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_vulkan.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_vulkan.cpp)
endif ()