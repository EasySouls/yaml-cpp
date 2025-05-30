project "yaml-cpp"
  kind "StaticLib"
  language "C++"
  cppdialect "C++20"
  staticruntime "off"

  targetdir("bin/" .. outputdir .. "/%{prj.name}")
  objdir("bin-int/" .. outputdir .. "/%{prj.name}")

  files
  {
	  "src/**.h",
	  "src/**.cpp",

	  "include/**.h",
	  "include/yaml-cpp/**.h",
	  "include/yaml-cpp/node/**.h",
	  "include/yaml-cpp/node/detail/**.h",
  }

  includedirs
  {
	  "include",
  }

  defines
  {
	  "YAML_CPP_STATIC_DEFINE",
  }

  filter "system:windows"
    systemversion "latest"

  filter "system:linux"
    pic "On"
    systemversion "latest"

  filter "configurations:Debug"
    runtime "Debug"
    symbols "on"

  filter "configurations:Release"
    runtime "Release"
    optimize "on"
