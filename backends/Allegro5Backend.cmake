option(IMGUI_BACKEND_ALLEGRO5
        "Set to ON to include Allegro5 backend files."
        OFF
)

if (IMGUI_BACKEND_ALLEGRO5)
message(STATUS "[ImGui] Including backend: Allegro5")
    list(APPEND IMGUI_PUBLIC_H_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_allegro5.h)
    list(APPEND IMGUI_PUBLIC_CXX_FILES ${IMGUI_BACKENDS_DIR}/imgui_impl_allegro5.cpp)
endif()