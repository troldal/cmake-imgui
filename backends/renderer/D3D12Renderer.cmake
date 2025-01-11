if (IMGUI_RENDERER_NAME STREQUAL "DX12")

    if (NOT IMGUI_PLATFORM_NAME STREQUAL "WIN32")
        message(FATAL_ERROR "${IMGUI_RENDERER_NAME} renderer can only be used on Windows platforms")
    endif()

    message(STATUS "[ImGui] Including renderer: ${IMGUI_RENDERER_NAME}")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_dx12.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_dx12.cpp)
    list(APPEND IMGUI_EXTERNAL_LIBS d3d12)
    list(APPEND IMGUI_EXTERNAL_LIBS dxgi)
    target_compile_definitions(${PROJECT_NAME} PRIVATE ImTextureID=ImU64)
    # list(APPEND IMGUI_INTERFACE_LIBS d3dcompiler)
endif ()
