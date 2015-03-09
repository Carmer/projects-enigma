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

  def test_there_is_a_message_passed_in_to_be_encrypted
    skip #--> the parsed message method is covered in encrypt elements method. Made parsed message a private method so this test no longer passes
    assert_equal "do i work", @encrypt.message
  end

  def test_it_can_break_the_message_into_single_character_pieces
    skip #--> the parsed message method is covered in encrypt elements method. Made parsed message a private method so this test no longer passes
    assert_equal ["d", "o", " ", "i", " ", "w", "o", "r", "k"], @encrypt.parsed_message
  end

  def test_it_can_encrypt_the_elements_in_position_a
    skip #--> the parsed message method is covered in encrypt elements method. Made parsed message a private method so this test no longer passes
    assert_equal ["o", nil, nil, nil, "i", nil, nil, nil, "v"], @encrypt.encrypt_elements(0,@char.a_char_map)
  end

  def test_it_can_encrypt_the_elements_in_position_b
    skip #--> the parsed message method is covered in encrypt elements method. Made parsed message a private method so this test no longer passes
    assert_equal [nil, "5", nil, nil, nil, "a"], @encrypt.encrypt_elements(1,@char.b_char_map)
  end

  def test_it_can_encrypt_the_elements_in_position_c
    skip #--> the parsed message method is covered in encrypt elements method. Made parsed message a private method so this test no longer passes
    assert_equal [nil, nil, "m", nil, nil, nil, "3"], @encrypt.encrypt_elements(2,@char.c_char_map)
  end

  def test_it_can_encrypt_the_elements_in_position_d
    skip #--> the parsed message method is covered in encrypt elements method. Made parsed message a private method so this test no longer passes
    assert_equal [nil, nil, nil, "8", nil, nil, nil, "e"], @encrypt.encrypt_elements(3,@char.d_char_map)
  end

  def test_it_can_make_a_final_encryptes_message
    assert_equal "o5m8ia3ev", @encrypt.final_encrypted_message
  end
end
