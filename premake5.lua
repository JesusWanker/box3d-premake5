

project "box3d"
  kind "StaticLib" --Can be replaced to "SharedLib" for a DLL
  language "C++"

  cdialect "C11"
  cppdialect "C++17"

  architecture "x86_64"

  targetdir ("%{wks.location}/bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}")
  objdir ("%{wks.location}/bin-int/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}")

  includedirs {
    "include",
    "src"
  }

files {
  "include/**.h",
  "src/**.c",
  "src/**.cpp",
  "src/**.h"
}

  filter "system:linux"
    buildoptions { "-ffp-contract=off" }

  filter "system:windows"
    systemversion "latest"
    staticruntime "On" -- Set to Off if MSVC MT/MTd or On if MSVC MD/MDd

filter "configurations:Debug"
  symbols "On"

filter "configurations:Release"
  symbols "Off"
