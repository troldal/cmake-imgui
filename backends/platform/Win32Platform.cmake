if (IMGUI_PLATFORM_NAME STREQUAL "WIN32")
message(STATUS "[ImGui] Including platform: ${IMGUI_PLATFORM_NAME}")

if (NOT WIN32)
    message(FATAL_ERROR "${IMGUI_PLATFORM_NAME} platform can only be used on Windows systems")
endif()

if (EMSCRIPTEN)
    message(FATAL_ERROR "${IMGUI_PLATFORM_NAME} platform can't be used with Emscripten")
endif()

    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_win32.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_win32.cpp)
endif()