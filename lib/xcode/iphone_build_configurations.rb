module Xcode
  module IPhoneBuildConfigurations    
    TargetDebug = {
			"COPY_PHASE_STRIP" => "NO",
			"FRAMEWORK_SEARCH_PATHS" => [%Q("$(inherited)"), %("\\"$(SRCROOT)/frameworks\\"")],
			"GCC_DYNAMIC_NO_PIC" => "NO",
			"GCC_ENABLE_FIX_AND_CONTINUE" => "NO",
			"GCC_OPTIMIZATION_LEVEL" => "0",
			"GCC_PRECOMPILE_PREFIX_HEADER" => "YES",
			"GCC_PREFIX_HEADER" => "Prefix.pch",
      # "GCC_WARN_INHIBIT_ALL_WARNINGS" => "YES",
			"GCC_WARN_INHIBIT_ALL_WARNINGS" => "NO",
			"HEADER_SEARCH_PATHS" => "/usr/include/libxml2",									
			"INFOPLIST_FILE" => "Info.plist"
    }
    TargetRelease = {
  		"COPY_PHASE_STRIP" => "YES",
  		"FRAMEWORK_SEARCH_PATHS" => [%Q("$(inherited)"), %("\\"$(SRCROOT)/frameworks\\"")],
  		"GCC_PRECOMPILE_PREFIX_HEADER" => "YES",
  		"GCC_PREFIX_HEADER" => "Prefix.pch",
			"HEADER_SEARCH_PATHS" => "/usr/include/libxml2",			  		
  		"INFOPLIST_FILE" => "Info.plist"
    }
    ProjectDebug = {
  		"ALWAYS_SEARCH_USER_PATHS" => "NO",
  		"ARCHS" => %q("$(ARCHS_STANDARD_32_BIT)"),
  		"FRAMEWORK_SEARCH_PATHS" => [%Q("$(inherited)"), %("\\"$(SRCROOT)/frameworks\\""), "/Developer/Library/Frameworks"],
  		"GCC_C_LANGUAGE_STANDARD" => "gnu99",
  		"GCC_WARN_ABOUT_RETURN_TYPE" => "YES",
  		"GCC_WARN_UNUSED_VARIABLE" => "YES",
      # "GCC_WARN_INHIBIT_ALL_WARNINGS" => "YES",
  		"GCC_WARN_INHIBIT_ALL_WARNINGS" => "NO",
  		"LIBRARY_SEARCH_PATHS" => [%Q("$(inherited)")],
  		"ONLY_ACTIVE_ARCH" => "YES",
  		"PREBINDING" => "NO",
			"HEADER_SEARCH_PATHS" => "/usr/include/libxml2",
  		"SDKROOT" => "iphoneos2.0"
    }
    ProjectRelease = {
      "ARCHS" => %q("$(ARCHS_STANDARD_32_BIT)"),
  		"GCC_C_LANGUAGE_STANDARD" => "gnu99",      
  		"FRAMEWORK_SEARCH_PATHS" => [%Q("$(inherited)"), %("\\"$(SRCROOT)/frameworks\\""), "/Developer/Library/Frameworks"],
  		"PREBINDING" => "NO",
			"HEADER_SEARCH_PATHS" => "/usr/include/libxml2",			  		
  		"SDKROOT" => "iphoneos2.0"
    }
  end
end
