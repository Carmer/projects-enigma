require './test/test_helper'
require './lib/crack'

class CrackTest < Minitest::Test

  def test_crack_recognized_a_message_for_an_input
    victory = Crack.new("02/03/2015", "o5m8ia3ev")
    assert_equal "o5m8ia3ev", victory.message
  end

  def test_crack_recognized_a_date_for_an_input
    victory = Crack.new("02/03/2015", "o5m8ia3ev")
    assert_equal "02/03/2015", victory.date
  end

  def test_it_can_find_the_offset_value_for_a
    victory = Crack.new("02/03/2015", "o5m8ia3ev")
    assert_equal 9, victory.off.offset_a
  end

  def test_it_can_find_the_offset_value_for_b
    victory = Crack.new("02/03/2015", "o5m8ia3ev")
    assert_equal 2, victory.off.offset_b
  end

  def test_it_can_find_the_offset_value_for_c
    victory = Crack.new("02/03/2015", "o5m8ia3ev")
    assert_equal 2, victory.off.offset_c
  end

  def test_it_can_find_the_offset_value_for_d
    victory = Crack.new("02/03/2015", "o5m8ia3ev")
    assert_equal 5, victory.off.offset_d
  end

end
