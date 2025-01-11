if (IMGUI_RENDERER_NAME STREQUAL "DX9")
message(STATUS "[ImGui] Including renderer: ${IMGUI_RENDERER_NAME}")
if (NOT IMGUI_PLATFORM_NAME STREQUAL "WIN32")
    message(FATAL_ERROR "${IMGUI_RENDERER_NAME} renderer can only be used on Windows platforms")
endif()

    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_dx9.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_dx9.cpp)
    list(APPEND IMGUI_INTERFACE_LIBS d3d9)
endif()