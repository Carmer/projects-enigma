require './test/test_helper'
require './lib/decryptor'

class DecryptorMinitest < Minitest::Test

  def setup
    @k        = Key.new([4,1,5,2,1])
    @off      = Offset.new("03/03/2015")
    @rotator  = Rotator.new(@k, @off)
    @char     = CharacterMapGenerator.new(@rotator)
    @secret   = Decryptor.new("o5m8ia3ev", @char)
  end

  def test_there_is_a_message_passed_in_to_be_decrypted
    skip #--> the parsed message method is covered in encrypt elements method. Made parsed message a private method so this test no longer passes
    assert @secret.respond_to?(:parsed_message)
  end

  def test_it_can_break_the_message_into_single_character_pieces
    skip #--> the parsed message method is covered in encrypt elements method. Made parsed message a private method so this test no longer passes
    assert_equal ["o", "5", "m", "8", "i", "a", "3", "e", "v"], @secret.parsed_message
  end

  def test_it_can_decrypt_the_elements_in_position_a
    assert_equal ["d", nil, nil, nil, " ", nil, nil, nil, "k"], @secret.decrypt_elements(0, @char.char_map_rot_a)
  end

  def test_it_can_decrypt_the_elements_in_position_b
    assert_equal [nil, "o", nil, nil, nil, "w"], @secret.decrypt_elements(1, @char.char_map_rot_b)
  end

  def test_it_can_decrypt_the_elements_in_position_c
    assert_equal [nil, nil, " ", nil, nil, nil, "o"], @secret.decrypt_elements(2, @char.char_map_rot_c)
  end

  def test_it_can_decrypt_the_elements_in_position_d
    assert_equal [nil, nil, nil, "i", nil, nil, nil, "r"], @secret.decrypt_elements(3, @char.char_map_rot_d)
  end

  def test_it_can_make_a_final_decrypted_message
    assert_equal "do i work", @secret.final_decrypted_message
  end
end
