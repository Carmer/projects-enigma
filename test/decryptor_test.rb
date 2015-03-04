require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/decryptor'

class DecryptorMinitest < Minitest::Test

  def test_it_can_accept_a_decrypted_message
    message = Decryptor.new("")


end
