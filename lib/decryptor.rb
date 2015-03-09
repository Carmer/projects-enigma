require './lib/character_map_generator'

class Decryptor

  attr_reader :date

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize(encrypted_message = nil, char_map)
    encrypted_message ? @encrypted_message = encrypted_message : @encrypted_message = File.read(ARGV[0])
    @new_message       = ARGV[1]
    @decrypted_message = []
    @char_map          = char_map
  end

  def final_decrypted_message
    decrypt_elements(0, @char_map.a_char_map)
    decrypt_elements(1, @char_map.b_char_map)
    decrypt_elements(2, @char_map.c_char_map)
    decrypt_elements(3, @char_map.d_char_map)
    @decrypted_message.join
  end

  def write_to_file
    output         = File.open(@new_message, "w")
    decrypted_text = @decrypted_message.join
    output.write(decrypted_text)
    output.close
  end

   private

    def parsed_message
      @encrypted_message.split("")
    end

    def decrypt_elements(index_pos, rot_char_map)
      until index_pos > parsed_message.size - 1 do
        parsed_message.map.with_index do |element, index|
          if index == index_pos
            index_pos += 4
            index_holder = rot_char_map.index(element)
            @decrypted_message[index] = CHAR_MAP[index_holder]
          end
        end
      end
      @decrypted_message
    end
end

if __FILE__ == $0
@k        = Key.new(ARGV[2])
@off      = Offset.new(ARGV[3])
@rotator  = Rotator.new(@k, @off)
@char     = CharacterMapGenerator.new(@rotator)

decrypt   = Decryptor.new(@encrypted_message, @char)

decrypt.final_decrypted_message
decrypt.write_to_file
end
