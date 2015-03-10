require './test/test_helper'
require './lib/encryptor'

class EncryptorTest < Minitest::Test

  def setup
    @k        = Key.new("41521")
    @off      = Offset.new("030315")
    @rotator  = Rotator.new(@k, @off)
    @char     = CharacterMapGenerator.new(@rotator)
    @encrypt  = Encryptor.new("do i work", @char)
  end

  def test_it_can_encrypt_the_elements_in_position_a
    assert_equal ["o", nil, nil, nil, "i", nil, nil, nil, "v"], @encrypt.encrypt_elements(0,@char.a_char_map)
  end

  def test_it_can_encrypt_the_elements_in_position_b
    assert_equal [nil, "5", nil, nil, nil, "a"], @encrypt.encrypt_elements(1,@char.b_char_map)
  end

  def test_it_can_encrypt_the_elements_in_position_c
    assert_equal [nil, nil, "m", nil, nil, nil, "3"], @encrypt.encrypt_elements(2,@char.c_char_map)
  end

  def test_it_can_encrypt_the_elements_in_position_d
    assert_equal [nil, nil, nil, "8", nil, nil, nil, "e"], @encrypt.encrypt_elements(3,@char.d_char_map)
  end

  def test_it_can_make_a_final_encrypted_message
    assert_equal "o5m8ia3ev", @encrypt.final_encrypted_message
  end

  def test_it_can_write_to_a_file
    assert @encrypt.respond_to?(:writer)
  end
end
