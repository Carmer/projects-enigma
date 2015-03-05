require './test/test_helper'
require './lib/crack'

class CrackTest < Minitest::Test

  def test_crack_recognized_a_date_for_an_input
    victory = Crack.new("02/03/2015")
    assert_equal "02/03/2015", victory.message
  end

  def test_it_can_find_the_offset_value_for_a
    skip
    victory = Crack.new
    assert_equal 9, victory.off.offset_a
  end

  def test_it_can_find_the_offset_value_for_b
    skip
    victory = Crack.new
    assert_equal 2, victory.off.offset_b
  end

  def test_it_can_find_the_offset_value_for_c
    skip
    victory = Crack.new
    assert_equal 2, victory.off.offset_c
  end

  def test_it_can_find_the_offset_value_for_d
    skip
    victory = Crack.new
    assert_equal 5, victory.off.offset_d
  end
end
