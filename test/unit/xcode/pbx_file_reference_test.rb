require File.dirname(__FILE__) + "/../test_helper"

class PbxFileReferenceTest < Test::Unit::TestCase
  def test_a_file_filetype
    ref = Xcode::PBXFileReference.new_from_file("foo.a")
    assert_equal "archive.ar", ref.attributes["lastKnownFileType"]
  end
  
  def test_fileEncoding_for_h_file
    ref = Xcode::PBXFileReference.new_from_file("foo.h")
    assert_equal "4", ref.attributes["fileEncoding"]
  end
  
  def test_lastKnownFileType_for_h_file
    ref = Xcode::PBXFileReference.new_from_file("foo.h")
    assert_equal "sourcecode.c.h", ref.attributes["lastKnownFileType"]
  end
  
  def test_last_known_file_type_for_plist
    ref = Xcode::PBXFileReference.new_from_file("foo.plist")
    assert_equal "text.plist.xml", ref.attributes["lastKnownFileType"]
  end
  
  def test_last_known_file_type_for_strings
    ref = Xcode::PBXFileReference.new_from_file("foo.strings")
    assert_equal "text.plist.strings", ref.attributes["lastKnownFileType"]
  end
  
  def test_attributes_for_h_file
    ref = Xcode::PBXFileReference.new_from_file("foo.h")
    assert_equal ["isa", "fileEncoding", "lastKnownFileType", "path", "sourceTree"].sort, ref.attributes.keys.sort
  end

  def test_fileEncoding_for_h_file
    ref = Xcode::PBXFileReference.new_from_file("foo.m")
    assert_equal "4", ref.attributes["fileEncoding"]
  end
  
  def test_lastKnownFileType_for_h_file
    ref = Xcode::PBXFileReference.new_from_file("foo.m")
    assert_equal "sourcecode.c.objc", ref.attributes["lastKnownFileType"]
  end
  
  def test_attributes_for_h_file
    ref = Xcode::PBXFileReference.new_from_file("foo.m")
    assert_equal ["isa", "fileEncoding", "lastKnownFileType", "path", "sourceTree"].sort, ref.attributes.keys.sort
  end  

  def test_lastKnownFileType_for_image_file
    ref = Xcode::PBXFileReference.new_from_file("foo.png")
    assert_equal "image.png", ref.attributes["lastKnownFileType"]
    ref = Xcode::PBXFileReference.new_from_file("foo.tiff")
    assert_equal "image.tiff", ref.attributes["lastKnownFileType"]
    ref = Xcode::PBXFileReference.new_from_file("foo.jpg")
    assert_equal "image.jpeg", ref.attributes["lastKnownFileType"]
    ref = Xcode::PBXFileReference.new_from_file("foo.jpeg")
    assert_equal "image.jpeg", ref.attributes["lastKnownFileType"]
  end
  
  def test_attributes_for_image_file
    ref = Xcode::PBXFileReference.new_from_file("foo.png")
    assert_equal ["isa", "lastKnownFileType", "path", "sourceTree"].sort, ref.attributes.keys.sort
  end  

  def test_isa
    ref = Xcode::PBXFileReference.new_from_file("foo.any")
    assert_equal "PBXFileReference", ref.isa
  end
  
  def test_source_tree
    ref = Xcode::PBXFileReference.new_from_file("foo.any")
    assert_equal "<group>", ref.attributes["sourceTree"]
  end
end
