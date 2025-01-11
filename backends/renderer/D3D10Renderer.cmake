if (IMGUI_RENDERER_NAME STREQUAL "DX10")
message(STATUS "[ImGui] Including renderer: ${IMGUI_RENDERER_NAME}")

if (NOT IMGUI_PLATFORM_NAME STREQUAL "WIN32")
    message(FATAL_ERROR "${IMGUI_RENDERER_NAME} renderer can only be used on Windows platforms")
endif()

    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_dx10.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_dx10.cpp)
    list(APPEND IMGUI_INTERFACE_LIBS d3d10)
endif()