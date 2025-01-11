if (IMGUI_PLATFORM_NAME STREQUAL "SDL3")
    message(STATUS "[ImGui] Including platform: ${IMGUI_PLATFORM_NAME}")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_sdl3.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_sdl3.cpp)

    set(SDL_SHARED OFF)
    set(SDL_STATIC ON)
    FetchContent_Declare(
            FetchSDL3
            GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
            GIT_TAG preview-3.1.6
    )
    FetchContent_MakeAvailable(FetchSDL3)
    list(APPEND IMGUI_EXTERNAL_LIBS SDL3::SDL3)
endif ()