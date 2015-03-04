require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/encryption'

class EncryptionMinitest < Minitest::Test

  def test_there_is_a_message_passed_in_to_be_encrypted
    secret = Encryption.new("This is a message that will be encrypted, and it can have numbers like 0123456789.")
    assert_equal "This is a message that will be encrypted, and it can have numbers like 0123456789.", secret.message
  end

  def test_it_can_break_the_message_into_single_character_pieces
    secret = Encryption.new("This is a message that will be encrypted, and it can have numbers like 0123456789.")
    assert_equal ["T", "h", "i", "s", " ", "i", "s", " ", "a", " ", "m", "e", "s", "s", "a", "g", "e", " ", "t", "h", "a", "t", " ", "w", "i", "l", "l", " ", "b", "e", " ", "e", "n", "c", "r", "y", "p", "t", "e", "d", ",", " ", "a", "n", "d", " ", "i", "t", " ", "c", "a", "n", " ", "h", "a", "v", "e", " ", "n", "u", "m", "b", "e", "r", "s", " ", "l", "i", "k", "e", " ", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."], secret.parse_message
  end

  def test_it_can_find_if_it_is_an_a_element
    secret = Encryption.new("This is a message that will be encrypted, and it can have numbers like 0123456789.")
    assert 





end
