require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/key'

class KeyMinitest < Minitest::Test

  def test_key_is_passed_into_new_instance_of_key
    k = KeyParse.new
    assert_equal [4,1,5,2,1], k.key
  end

  def test_the_key_must_be_5_digits
    k = KeyParse.new
    assert k.key_valid?
  end

  def test_it_can_find_the_value_to_rotate_a
    k = KeyParse.new
    assert_equal 41, k.rotate_a
  end

  def test_it_can_find_the_value_to_rotate_b
    k = KeyParse.new
    assert_equal 15, k.rotate_b
  end

  def test_it_can_find_the_value_to_rotate_c
    k = KeyParse.new
    assert_equal 52, k.rotate_c
  end

  def test_it_can_find_the_value_to_rotate_d
    k = KeyParse.new
    assert_equal 21, k.rotate_d
  end



end
