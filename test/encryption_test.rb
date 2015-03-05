require './test/test_helper'
require './lib/encryption'

class EncryptionMinitest < Minitest::Test

  def test_there_is_a_message_passed_in_to_be_encrypted
    secret = Encryption.new("this is a message that will be encrypted, and it can have numbers like 0123456789.")
    assert_equal "this is a message that will be encrypted, and it can have numbers like 0123456789.", secret.message
  end

  def test_it_can_break_the_message_into_single_character_pieces
    secret = Encryption.new("this is a message that will be encrypted, and it can have numbers like 0123456789.")
    assert_equal ["t", "h", "i", "s", " ", "i", "s", " ", "a", " ", "m", "e", "s", "s", "a", "g", "e", " ", "t", "h", "a", "t", " ", "w", "i", "l", "l", " ", "b", "e", " ", "e", "n", "c", "r", "y", "p", "t", "e", "d", ",", " ", "a", "n", "d", " ", "i", "t", " ", "c", "a", "n", " ", "h", "a", "v", "e", " ", "n", "u", "m", "b", "e", "r", "s", " ", "l", "i", "k", "e", " ", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."], secret.parsed_message
  end

  def test_it_can_encrypt_the_elements_in_position_a
    secret = Encryption.new("do i work")
    secret.encrypt_a_elements
    assert_equal ["o", nil, nil, nil, "i", nil, nil, nil, "v"], secret.encrypted_message
  end

  def test_it_can_encrypt_the_elements_in_position_b
    secret = Encryption.new("do i work")
    secret.encrypt_b_elements
    assert_equal [nil, "5", nil, nil, nil, "a"], secret.encrypted_message
  end

  def test_it_can_encrypt_the_elements_in_position_c
    secret = Encryption.new("do i work")
    secret.encrypt_c_elements
    assert_equal [nil, nil, "m", nil, nil, nil, "3"], secret.encrypted_message
  end

  def test_it_can_encrypt_the_elements_in_position_d
    secret = Encryption.new("do i work")
    secret.encrypt_d_elements
    assert_equal [nil, nil, nil, "8", nil, nil, nil, "e"], secret.encrypted_message
  end

  def test_it_can_make_a_final_encryptes_message
    secret = Encryption.new("do i work")
    assert_equal "o5m8ia3ev", secret.final_encrypted_message
  end

end
