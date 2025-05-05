cmake_minimum_required(VERSION 3.25...4.0)
project(UEInspector)
include(cmake/common.cmake)
include(cmake/dependencies/imgui.cmake)

file(GLOB_RECURSE SOURCES "src/*.c" "src/*.cpp")
set(HEADERS_DIRECTORIES src src/dxhook src/gui src/mem src/res)
set(UE_ROOT_DIR "D:\\UE5\\UE_5.4")

add_subdirectory(vendor/minhook)

# UE Insepctor
add_library(UEInspector SHARED ${SOURCES})

target_compile_definitions(UEInspector PRIVATE
    UE_BUILD_MINIMAL=1
    COREUOBJECT_VTABLE=
    UBT_COMPILED_PLATFORM=Windows
    UE_BUILD_SHIPPING=1
    WITH_EDITOR=0
    WITH_EDITORONLY_DATA=0
    WITH_ENGINE=1
    WITH_UNREAL_DEVELOPER_TOOLS=0
    WITH_PLUGIN_SUPPORT=0
    WITH_SERVER_CODE=0
    IS_MONOLITHIC=1
    IS_PROGRAM=1
    PLATFORM_WINDOWS
    PLATFORM_64BITS
    CORE_API=
    COREUOBJECT_API=
    NOMINMAX
    WIN32
    NDEBUG
    UEINSPECTOR_EXPORTS
    _WINDOWS
    _USRDLL
    UNICODE
    _UNICODE
)
set(UE_INCLUDE_DIR
    ${UE_ROOT_DIR}/Engine/Source/Runtime/Core/Public
    ${UE_ROOT_DIR}/Engine/Source/Runtime/Core/Public/UObject
    ${UE_ROOT_DIR}/Engine/Source/Runtime/CoreUObject/Public
    ${UE_ROOT_DIR}/Engine/Source/Runtime/TraceLog/Public
)

target_include_directories(UEInspector PRIVATE 
    vendor/imgui
    vendor/imgui/backends
    vendor/minhook
    ${UE_INCLUDE_DIR}
)

target_link_libraries(UEInspector PRIVATE 
    minhook 
    imgui
    d3d11 
    d3dcompiler 
    dxgi
)
