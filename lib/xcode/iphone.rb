module Xcode
  module IPhone
    FrameworksGroup = Xcode::PBXGroup.new(
      "name" => "Frameworks",
      "children" => [
        # ::Xcode::Frameworks::AddressBook,
        # ::Xcode::Frameworks::AddressBookUI,
        # ::Xcode::Frameworks::AudioToolbox,
        # ::Xcode::Frameworks::CoreGraphics,
        # ::Xcode::Frameworks::CoreLocation,
        ::Xcode::Frameworks::Foundation,
        # ::Xcode::Frameworks::FrameworkX,
        # ::Xcode::Frameworks::FrameworkXCore,        
        ::Xcode::Frameworks::LibICU,
        # ::Xcode::Frameworks::LibSQLite,
        # ::Xcode::Frameworks::LibXML,             
        # ::Xcode::Frameworks::OpenGLES,        
        # ::Xcode::Frameworks::QuartzCore,   
        # ::Xcode::Frameworks::Security,
        # ::Xcode::Frameworks::SenTestingKit,
        # ::Xcode::Frameworks::UIKit
      ].map(&:id)
    )
  end
end
