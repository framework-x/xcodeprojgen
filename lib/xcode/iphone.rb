module Xcode
  module IPhone
    LinkedFrameworksGroup = Xcode::PBXGroup.new(
      "name" => "Linked Frameworks",
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
    FrameworksGroup = Xcode::PBXGroup.new(
      "name" => "Frameworks",
      "children" => [LinkedFrameworksGroup].map(&:id)
    )
  end
end
