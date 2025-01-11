if (IMGUI_PLATFORM_NAME STREQUAL "SDL2")
message(STATUS "[ImGui] Including platform: ${IMGUI_PLATFORM_NAME}")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_sdl2.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_sdl2.cpp)
    if (EMSCRIPTEN)
        message(STATUS "[ImGui] Using bundled ${IMGUI_PLATFORM_NAME} in Emscripten")
        list(APPEND IMGUI_LINK_OPTIONS -sUSE_SDL=2)
    else()
        message(STATUS "[ImGui] Using external ${IMGUI_PLATFORM_NAME}")
        find_package(SDL2 CONFIG REQUIRED)
        list(APPEND IMGUI_EXTERNAL_LIBS SDL2::SDL2main SDL2::SDL2)
#        target_link_libraries(${PROJECT_NAME}
#                PUBLIC
#                SDL2::SDL2main
#                $<IF:$<TARGET_EXISTS:SDL2::SDL2>,SDL2::SDL2,SDL2::SDL2-static>
#        )
    endif ()
endif ()