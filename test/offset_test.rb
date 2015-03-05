require './test/test_helper'
require './lib/offset'

class OffsetMinitest < Minitest::Test

  def test_it_can_see_date
    off = Offset.new
  end

  def test_it_can_sq_date
    off = Offset.new
    assert_equal 918999225, off.sq_date
  end

  def test_it_can_find_offset_digits
    off = Offset.new
    off.sq_date
    assert_equal "9225", off.find_offset_digits
  end

  def test_it_can_find_offset_digit_in_first_position_and_assign_it_to_variable_offset_a
    off = Offset.new
    assert_equal 9, off.offset_a
  end

  def test_it_can_find_offset_digit_in_first_position_and_assign_it_to_variable_offset_b
    off = Offset.new
    assert_equal 2, off.offset_b
  end

  def test_it_can_find_offset_digit_in_first_position_and_assign_it_to_variable_offset_c
    off = Offset.new
    assert_equal 2, off.offset_c
  end

  def test_it_can_find_offset_digit_in_first_position_and_assign_it_to_variable_offset_d
    off = Offset.new
    assert_equal 5, off.offset_d
  end



end
