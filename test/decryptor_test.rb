require './test/test_helper'
require './lib/decryptor'

class DecryptorTest < Minitest::Test

  def setup
    @k        = Key.new("41521")
    @off      = Offset.new("030315")
    @rotator  = Rotator.new(@k, @off)
    @char     = CharacterMapGenerator.new(@rotator)
    @secret   = Decryptor.new("o5m8ia3ev", @char)
  end

  def test_it_can_decrypt_the_elements_in_position_a
    assert_equal ["d", nil, nil, nil, " ", nil, nil, nil, "k"], @secret.decrypt_elements(0, @char.a_char_map)
  end

  def test_it_can_decrypt_the_elements_in_position_b
    assert_equal [nil, "o", nil, nil, nil, "w"], @secret.decrypt_elements(1, @char.b_char_map)
  end

  def test_it_can_decrypt_the_elements_in_position_c
    assert_equal [nil, nil, " ", nil, nil, nil, "o"], @secret.decrypt_elements(2, @char.c_char_map)
  end

  def test_it_can_decrypt_the_elements_in_position_d
    assert_equal [nil, nil, nil, "i", nil, nil, nil, "r"], @secret.decrypt_elements(3, @char.d_char_map)
  end

  def test_it_can_make_a_final_decrypted_message
    assert_equal "do i work", @secret.final_decrypted_message
  end

  def test_it_can_write_to_file
    assert @secret.respond_to?(:writer)
  end
end
