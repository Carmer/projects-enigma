require './test/test_helper'
require "./lib/rotator"


class RotatorMinitest < Minitest::Test

  def test_it_has_a_CHAR_MAP
    sum = Rotator.new
    assert_equal [*("a".."z"), *("0".."9"), " ", ".", ","], CHAR_MAP
  end

  def test_it_can_find_the_total_rotator_value_for_a
    sum = Rotator.new
    assert_equal 50, sum.a_final_rotate_value
  end

  def test_it_can_find_the_total_rotator_value_for_b
    sum = Rotator.new
    assert_equal 17, sum.b_final_rotate_value
  end

  def test_it_can_find_the_total_rotator_value_for_c
    sum = Rotator.new
    assert_equal 54, sum.c_final_rotate_value
  end

  def test_it_can_find_the_total_rotator_value_for_d
    sum = Rotator.new
    assert_equal 26, sum.d_final_rotate_value
  end

  def test_it_creates_a_new_char_map_based_on_final_rot_value_for_a
    sum = Rotator.new
    assert_equal ["l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ",", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k"], sum.char_map_rot_a
  end

  def test_it_creates_a_new_char_map_based_on_final_rot_value_for_b
    sum = Rotator.new
    assert_equal ["r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ",", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q"], sum.char_map_rot_b
  end

  def test_it_creates_a_new_char_map_based_on_final_rot_value_for_b
    sum = Rotator.new
    assert_equal ["p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ",", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o"], sum.char_map_rot_c
  end

  def test_it_creates_a_new_char_map_based_on_final_rot_value_for_c
    sum = Rotator.new
    assert_equal ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ",", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"], sum.char_map_rot_d
  end

end
