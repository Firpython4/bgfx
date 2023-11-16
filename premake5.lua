
workspace "bgfx"
    configurations { "Debug", "Release" }

project "bgfx"
    kind "StaticLib"
    language "C++"
    targetdir ".build/bin/%{cfg.buildcfg}"
    objdir ".build/obj/%{cfg.buildcfg}"

    files {
        "src/**.cpp",
        "src/**.h",
        "src/**.natvis",
        "scripts/shader/**.sc",
    }

    includedirs {
        "include",
        "3rdparty",
        "3rdparty/khronos",
        "3rdparty/dxsdk/include",
        "src",
    }

    configuration "Debug"
        defines { "DEBUG" }
        symbols "On"

    configuration "Release"
        defines { "NDEBUG" }
        optimize "On"

project "geometryc"
    kind "ConsoleApp"
    language "C++"
    targetdir "tools/bin/%{cfg.system}/%{cfg.buildcfg}"

    files {
        "tools/geometryc/**.cpp",
        "tools/geometryc/**.h",
    }

    includedirs {
        "include",
        "3rdparty",
        "3rdparty/khronos",
        "tools/geometryc",
        "src",
    }

    links {
        "bgfx",
    }

    configuration "Debug"
        defines { "DEBUG" }
        symbols "On"

    configuration "Release"
        defines { "NDEBUG" }
        optimize "On"
