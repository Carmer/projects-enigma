require './test/test_helper'
require "./lib/rotator"

class RotatorTest < Minitest::Test

  def setup
    @k   = Key.new("41521")
    @off = Offset.new("030315")
    @sum = Rotator.new(@k, @off)
  end

  def test_it_can_find_the_total_rotator_value_for_a
    assert_equal 50, @sum.a_final_rotate_value
  end

  def test_it_can_find_the_total_rotator_value_for_b
    assert_equal 17, @sum.b_final_rotate_value
  end

  def test_it_can_find_the_total_rotator_value_for_c
    assert_equal 54, @sum.c_final_rotate_value
  end

  def test_it_can_find_the_total_rotator_value_for_d
    assert_equal 26, @sum.d_final_rotate_value
  end
end
