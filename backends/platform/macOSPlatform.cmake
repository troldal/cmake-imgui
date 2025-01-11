if (IMGUI_PLATFORM_NAME STREQUAL "MACOS")
    if(NOT APPLE)
        message(FATAL_ERROR "${IMGUI_PLATFORM_NAME} platform can only be used on Apple systems")
    endif()

    if(EMSCRIPTEN)
        message(FATAL_ERROR "${IMGUI_PLATFORM_NAME} platform can't be used with Emscripten")
    endif()

    message(STATUS "[ImGui] Including platform: ${IMGUI_PLATFORM_NAME}")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_osx.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_osx.mm)
endif ()