require_relative 'test_helper'
require './lib/key'

class KeyMinitest < Minitest::Test

  def test_it_has_random_key
    skip
    k = Key.new
    sample = []
    10.times {k.key_gen << sample}
    assert sample.uniq
    end

  def test_key_is_passed_into_new_instance_of_key
    k = Key.new
    assert_equal [4,1,5,2,1], k.key_gen
  end

  def test_the_key_must_be_5_digits
    k = Key.new
    assert k.key_valid?
  end

  def test_it_can_find_the_value_to_rotate_a
    k = Key.new
    assert_equal 41, k.key_rotate_a
  end

  def test_it_can_find_the_value_to_rotate_b
    k = Key.new
    assert_equal 15, k.key_rotate_b
  end

  def test_it_can_find_the_value_to_rotate_c
    k = Key.new
    assert_equal 52, k.key_rotate_c
  end

  def test_it_can_find_the_value_to_rotate_d
    k = Key.new
    assert_equal 21, k.key_rotate_d
  end



end
