project "ImGuiFD"
	kind "StaticLib"
	language "C++"
    staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"ImGuiFileDialog.h",
		"ImGuiFileDialog.cpp",

		"ImGuiFileDialogConfig.h",

		"stb/stb_image.h",
		"stb/stb_image_resize2.h"
	}

	includedirs
	{
		"../imgui"
	}

	links { "ImGui" }

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
