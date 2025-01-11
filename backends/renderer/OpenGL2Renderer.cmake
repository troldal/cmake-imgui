if (IMGUI_RENDERER_NAME STREQUAL "OPENGL2")

    if (
            NOT IMGUI_PLATFORM_NAME STREQUAL "MACOS" AND
            NOT IMGUI_PLATFORM_NAME STREQUAL "GLFW" AND
            NOT IMGUI_PLATFORM_NAME STREQUAL "GLUT" AND
            NOT IMGUI_PLATFORM_NAME STREQUAL "SDL2")
        message(FATAL_ERROR "${IMGUI_RENDERER_NAME} renderer can only be used on MACOS platform or using GLFW, GLUT or SDL2")
    endif ()

    message(STATUS "[ImGui] Including renderer: ${IMGUI_RENDERER_NAME}")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_opengl2.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_opengl2.cpp)
    find_package(OpenGL REQUIRED)
    list(APPEND IMGUI_EXTERNAL_LIBS OpenGL::GL)
endif ()