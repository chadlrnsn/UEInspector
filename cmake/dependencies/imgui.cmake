file(GLOB IMGUI_SOURCES
    vendor/imgui/*.cpp
    vendor/imgui/backends/imgui_impl_dx11.cpp
    vendor/imgui/backends/imgui_impl_win32.cpp
)

set(IMGUI_HEADER_DIRECTORIES vendor/imgui vendor/imgui/backends)
add_library(imgui STATIC ${IMGUI_SOURCES})
target_include_directories(imgui PRIVATE vendor/imgui vendor/imgui/backends)