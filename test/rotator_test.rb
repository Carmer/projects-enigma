require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/rotator'

class RotatorMinitest < Minitest::Test

  def test_it_has_a_key_value_and_an_offset_value_for_all_4_elements
    sum = TotalRotator.new(41, 9, 15, 2, 52, 2, 21, 5)
    assert_equal 41, sum.a_key_value
    assert_equal 9,  sum.a_offset_value
    assert_equal 15, sum.b_key_value
    assert_equal 2,  sum.b_offset_value
    assert_equal 52, sum.c_key_value
    assert_equal 2,  sum.c_offset_value
    assert_equal 21, sum.d_key_value
    assert_equal 5,  sum.d_offset_value
  end

  def test_it_can_find_the_total_rotator_value_for_a
    sum = TotalRotator.new(41, 9, 15, 2, 52, 2, 21, 5)
    assert_equal 50, sum.a_final_rotate_value
  end

  def test_it_can_find_the_total_rotator_value_for_b
    sum = TotalRotator.new(41, 9, 15, 2, 52, 2, 21, 5)
    assert_equal 17, sum.b_final_rotate_value
  end

  def test_it_can_find_the_total_rotator_value_for_c
    sum = TotalRotator.new(41, 9, 15, 2, 52, 2, 21, 5)
    assert_equal 54, sum.c_final_rotate_value
  end

  def test_it_can_find_the_total_rotator_value_for_d
    sum = TotalRotator.new(41, 9, 15, 2, 52, 2, 21, 5)
    assert_equal 26, sum.d_final_rotate_value
  end

  def test_it_creates_a_new_char_map_based_on_final_rot_value_for_a
    sum = TotalRotator.new(41, 9, 15, 2, 52, 2, 21, 5)
    assert_equal ["l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l"], sum.char_map_rot_a
  end

  def test_it_creates_a_new_char_map_based_on_final_rot_value_for_b
    sum = TotalRotator.new(41, 9, 15, 2, 52, 2, 21, 5)
    assert_equal ["r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r"], sum.char_map_rot_b
  end

  def test_it_creates_a_new_char_map_based_on_final_rot_value_for_c
    sum = TotalRotator.new(41, 9, 15, 2, 52, 2, 21, 5)
    assert_equal ["p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"], sum.char_map_rot_c
  end

  def test_it_creates_a_new_char_map_based_on_final_rot_value_for_c
    sum = TotalRotator.new(41, 9, 15, 2, 52, 2, 21, 5)
    assert_equal ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0"], sum.char_map_rot_d
  end

end
