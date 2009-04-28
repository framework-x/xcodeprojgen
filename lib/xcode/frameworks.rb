module Xcode
  module Frameworks
    AddressBook = Xcode::PBXFileReference.new(
        "lastKnownFileType" => "wrapper.framework",
        "name" => "AddressBook.framework",
        "path" => "System/Library/Frameworks/AddressBook.framework",
        "sourceTree" => "SDKROOT"
    ) 
    AddressBookUI = Xcode::PBXFileReference.new(
      "lastKnownFileType" => "wrapper.framework",
      "name" => "AddressBookUI.framework",
      "path" => "System/Library/Frameworks/AddressBookUI.framework",
      "sourceTree" => "SDKROOT"
    ) 
    AudioToolbox = Xcode::PBXFileReference.new(
      "lastKnownFileType" => "wrapper.framework",
      "name" => "AudioToolbox.framework",
      "path" => "System/Library/Frameworks/AudioToolbox.framework",
      "sourceTree" => "SDKROOT"
    )        
    CoreGraphics = Xcode::PBXFileReference.new(
      "lastKnownFileType" => "wrapper.framework",
      "name" => "XCoreGraphics.framework",
      "path" => "System/Library/Frameworks/CoreGraphics.framework",
      "sourceTree" => "SDKROOT"
    )
    CoreLocation = Xcode::PBXFileReference.new(
      "lastKnownFileType" => "wrapper.framework",
      "name" => "CoreLocation.framework",
      "path" => "System/Library/Frameworks/CoreLocation.framework",
      "sourceTree" => "SDKROOT"
    )    
    Foundation = Xcode::PBXFileReference.new(
      "lastKnownFileType" => "wrapper.framework",
      "name" => "Foundation.framework",
      "path" => "System/Library/Frameworks/Foundation.framework",
      "sourceTree" => "SDKROOT"
    )
    FrameworkX = Xcode::PBXFileReference.new(
      "lastKnownFileType" => "wrapper.framework",
      "name" => "FrameworkX.framework",
      "path" => "frameworks/FrameworkX.framework",
      "sourceTree" => "<group>"
    )    
    FrameworkXCore = Xcode::PBXFileReference.new(
      "lastKnownFileType" => "wrapper.framework",
      "name" => "FrameworkXCore.framework",
      "path" => "frameworks/FrameworkXCore.framework",
      "sourceTree" => "<group>"
    )        
    LibICU = Xcode::PBXFileReference.new(
      "lastKnownFileType" => "wrapper.dylib",
      "name" => "libicucore.dylib",
      "path" => "usr/lib/libicucore.dylib",
      "sourceTree" => "SDKROOT"
    )
    LibSQLite = Xcode::PBXFileReference.new(
      "lastKnownFileType" => "wrapper.dylib",
      "name" => "libsqlite3.0.dylib",
      "path" => "/usr/lib/libsqlite3.0.dylib",
      "sourceTree" => "SDKROOT"
    )    
    LibXML = Xcode::PBXFileReference.new(
      "lastKnownFileType" => "wrapper.dylib",
      "name" => "libxml2.2.dylib",
      "path" => "usr/lib/libxml2.2.dylib",
      "sourceTree" => "SDKROOT"
    )    
    OpenGLES = Xcode::PBXFileReference.new(
        "lastKnownFileType" => "wrapper.framework",
        "name" => "OpenGLES.framework",
        "path" => "System/Library/Frameworks/OpenGLES.framework",
        "sourceTree" => "SDKROOT"
    )     
    Security = Xcode::PBXFileReference.new(
      "lastKnownFileType" => "wrapper.framework",
      "name" => "Foundation.framework",
      "path" => "System/Library/Frameworks/Security.framework",
      "sourceTree" => "SDKROOT"
    )    
    SenTestingKit = Xcode::PBXFileReference.new(
      "lastKnownFileType" => "wrapper.framework",
      "name" => "SenTestingKit.framework",
      "path" => "/Developer/Library/Frameworks/SenTestingKit.framework",
      "sourceTree" => "<absolute>"
    )
    QuartzCore = Xcode::PBXFileReference.new(
        "lastKnownFileType" => "wrapper.framework",
        "name" => "QuartzCore.framework",
        "path" => "System/Library/Frameworks/QuartzCore.framework",
        "sourceTree" => "SDKROOT"
    ) 
    UIKit = Xcode::PBXFileReference.new(
      "lastKnownFileType" => "wrapper.framework",
      "name" => "UIKit.framework",
      "path" => "System/Library/Frameworks/UIKit.framework",
      "sourceTree" => "SDKROOT"
    )
  end
end
