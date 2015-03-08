require './lib/character_map_generator'

class Decryptor

  attr_accessor :message,
                :decrypted_message

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize(message, char_map = CharacterMapGenerator.new)
    @message           = message
    @decrypted_message = []
    @char_map          = char_map
  end

  def decrypt_elements(index_pos, rot_char_map)
    until index_pos > parsed_message.size - 1 do
      parsed_message.map.with_index do |element, index|
        if index == index_pos
          index_pos += 4
          index_holder = rot_char_map.index(element)
          decrypted_message[index] = CHAR_MAP[index_holder]
        end
      end
    end
    decrypted_message
  end

  def final_decrypted_message
    decrypt_elements(0, @char_map.char_map_rot_a)
    decrypt_elements(1, @char_map.char_map_rot_b)
    decrypt_elements(2, @char_map.char_map_rot_c)
    decrypt_elements(3, @char_map.char_map_rot_d)
    decrypted_message.join
  end

  private

    def parsed_message
      message.split("")
    end
end
