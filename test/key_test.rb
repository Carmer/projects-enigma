require_relative 'test_helper'
require './lib/key'

class KeyTest < Minitest::Test

  def setup
    @k = Key.new("41521")
  end

  def test_it_can_find_the_value_to_rotate_a
    assert_equal 41, @k.key_rotate_a
  end

  def test_it_can_find_the_value_to_rotate_b
    assert_equal 15, @k.key_rotate_b
  end

  def test_it_can_find_the_value_to_rotate_c
    assert_equal 52, @k.key_rotate_c
  end

  def test_it_can_find_the_value_to_rotate_d
    assert_equal 21, @k.key_rotate_d
  end
end
