require './test/test_helper'
require './lib/offset'

class Offsettest < Minitest::Test

  def setup
    @off = Offset.new("030315")
  end

  def test_it_can_sq_date
    skip #=> skipping becasue these are private methods and they will be hit by the offset digit tests
    assert_equal 918999225, @off.sq_date
  end

  def test_it_can_find_offset_digits
    skip #=> skipping becasue these are private methods and they will be hit by the offset digit tests
    @off.sq_date
    assert_equal "9225", @off.find_offset_digits
  end

  def test_it_can_find_offset_digit_in_first_position_and_assign_it_to_variable_offset_a
    assert_equal 9, @off.offset_a
  end

  def test_it_can_find_offset_digit_in_first_position_and_assign_it_to_variable_offset_b
    assert_equal 2, @off.offset_b
  end

  def test_it_can_find_offset_digit_in_first_position_and_assign_it_to_variable_offset_c
    assert_equal 2, @off.offset_c
  end

  def test_it_can_find_offset_digit_in_first_position_and_assign_it_to_variable_offset_d
    assert_equal 5, @off.offset_d
  end
end
