module Xcode
  class PBXNativeTarget
    include PBXFormatter
    attr_reader :id, :build_configuration_list

    def initialize(name, attributes = {})
      @id = Xcode.register(self)
      @name = name
      @attributes = attributes
    end

    def attributes
      {
        "isa" => "PBXNativeTarget",
        "productName" => @name,
        "name" => @name,
        "productType" => "com.apple.product-type.application",
        "buildRules" => [],
        "dependencies" => [],
        "buildPhases" => []
      }.merge(@attributes)
    end
  end
end
