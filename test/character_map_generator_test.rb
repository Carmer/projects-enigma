require './test/test_helper'
require "./lib/character_map_generator"


class CharacterMapGeneratorTest < Minitest::Test

  def setup
    @k       = Key.new("41521")
    @off     = Offset.new("030315")
    @rotator = Rotator.new(@k, @off)
    @char    = CharacterMapGenerator.new(@rotator)
  end

  def test_it_creates_a_new_char_map_based_on_final_rot_value_for_a
    assert_equal ["l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ",", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k"], @char.a_char_map
  end

  def test_it_creates_a_new_char_map_based_on_final_rot_value_for_b
    assert_equal ["r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ",", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q"], @char.b_char_map
  end

  def test_it_creates_a_new_char_map_based_on_final_rot_value_for_c
    assert_equal ["p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ",", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o"], @char.c_char_map
  end

  def test_it_creates_a_new_char_map_based_on_final_rot_value_for_d
    assert_equal ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ",", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"], @char.d_char_map
  end
end
