if (IMGUI_PLATFORM_NAME STREQUAL "GLUT")

    if(EMSRIPTEN)
        message(FATAL_ERROR "${IMGUI_PLATFORM_NAME} platform can't be used with Emscripten")
    endif()

    message(STATUS "[ImGui] Including platform: ${IMGUI_PLATFORM_NAME}")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_glut.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_glut.cpp)
endif ()