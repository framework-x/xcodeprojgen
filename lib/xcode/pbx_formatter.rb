module Xcode
  module PBXFormatter
    def to_pbx
      attributes.to_pbx
    end
  end
end

Array.class_eval do
  def to_pbx
    "(" + map { |e| e.to_pbx }.join(", ") + ")"
  end  
end

Hash.class_eval do
  def to_pbx
    pieces = inject([]) do |pieces, (key, value)|
      pieces << "#{key.to_pbx} = #{value.to_pbx};"
    end
    "{#{pieces.join(" ")}}"
  end  
end

String.class_eval do
  def to_pbx
    if ['$', '(', ')', '<', '>', '-', '.', ' '].any? { |char| include? char }
      %("#{self}")
    elsif empty?
      "\"\""
    else
      self
    end
  end
end

TrueClass.class_eval do
  def to_pbx
    "YES"
  end
end

FalseClass.class_eval do
  def to_pbx
    "NO"
  end
end

Fixnum.class_eval do
  def to_pbx
    to_s
  end
end
