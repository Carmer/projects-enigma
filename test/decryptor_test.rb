require './test/test_helper'
require './lib/decryptor'

class DecryptorMinitest < Minitest::Test

  def test_there_is_a_message_passed_in_to_be_decrypted
    secret = Decryptor.new("o5m8ia3ev")
    assert secret.respond_to?(:parsed_message)
  end

  def test_it_can_break_the_message_into_single_character_pieces
    secret = Decryptor.new("o5m8ia3ev")
    assert_equal ["o", "5", "m", "8", "i", "a", "3", "e", "v"], secret.parsed_message
  end

  def test_it_can_decrypt_the_elements_in_position_a
    secret = Decryptor.new("o5m8ia3ev")
    secret.parsed_message
    secret.decrypt_a_elements
    assert_equal ["d", nil, nil, nil, " ", nil, nil, nil, "k"], secret.decrypted_message
  end

  def test_it_can_decrypt_the_elements_in_position_b
    secret = Decryptor.new("o5m8ia3ev")
    secret.decrypt_b_elements
    assert_equal [nil, "o", nil, nil, nil, "w"], secret.decrypted_message
  end

  def test_it_can_decrypt_the_elements_in_position_c
    secret = Decryptor.new("o5m8ia3ev")
    secret.parsed_message
    secret.decrypt_c_elements
    assert_equal [nil, nil, " ", nil, nil, nil, "o"], secret.decrypted_message
  end

  def test_it_can_decrypt_the_elements_in_position_d
    secret = Decryptor.new("o5m8ia3ev")
    secret.parsed_message
    secret.decrypt_d_elements
    assert_equal [nil, nil, nil, "i", nil, nil, nil, "r"], secret.decrypted_message
  end

  def test_it_can_make_a_final_decrypted_message
    secret = Decryptor.new("o5m8ia3ev")
    secret.parsed_message
    assert_equal "do i work", secret.final_decrypted_message

  end

end
