require './test/test_helper'
require './lib/decryptor'

class WriterTest < Minitest::Test

  def setup
    @w = Writer.new
  end

  def test_it_writes_to_a_file
    assert_equal nil, @w.write_to_file("tester.txt", ["t", "h", "i", "s", " ", "i", "s", " ", "a", " ", "m", "e", "s", "s", "a", "g", "e"])
  end

  def test_file_exists
    assert @w.file_exists?("exist_test_file.txt")
  end
end
