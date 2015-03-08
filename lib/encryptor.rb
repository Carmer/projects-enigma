require './lib/rotator'
require './lib/character_map_generator'

class Encryptor

  attr_accessor :message,
                :encrypted_message

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize(message, char_map = CharacterMapGenerator.new)
    @message           = message
    @encrypted_message = []
    @char_map          = char_map
  end

  def encrypt_elements(index_pos, rot_char_map)
    until index_pos > parsed_message.size - 1 do
      parsed_message.map.with_index do |element, index|
        if index == index_pos
          index_pos += 4
          index_holder = CHAR_MAP.index(element)
          encrypted_message[index] = rot_char_map[index_holder]
        end
      end
    end
    encrypted_message
  end

  def final_encrypted_message
    encrypt_elements(0, @char_map.char_map_rot_a)
    encrypt_elements(1, @char_map.char_map_rot_b)
    encrypt_elements(2, @char_map.char_map_rot_c)
    encrypt_elements(3, @char_map.char_map_rot_d)
    encrypted_message.join
  end

  private

    def parsed_message
      message.split("")
    end
end
