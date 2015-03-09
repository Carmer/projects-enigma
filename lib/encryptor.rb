require './lib/rotator'
require './lib/character_map_generator'

class Encryptor

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize(message, char_map = CharacterMapGenerator.new)
    message ? @message = message : @message = File.read(ARGV[0])
    @encrypted_message = []
    @new_encrypted_message = ARGV[1]
    @char_map          = char_map
  end

  def final_encrypted_message
    encrypt_elements(0, @char_map.a_char_map)
    encrypt_elements(1, @char_map.b_char_map)
    encrypt_elements(2, @char_map.c_char_map)
    encrypt_elements(3, @char_map.d_char_map)
    @encrypted_message.join
  end

  def write_to_file
    output         = File.open(@new_encrytped_message, "w")
    encrypted_text = final_encrypted_message
    output.write(encrypted_text)
    output.close
  end

  private

    def encrypt_elements(index_pos, rot_char_map)
      until index_pos > parsed_message.size - 1 do
        parsed_message.map.with_index do |element, index|
          if index == index_pos
            index_pos += 4
            index_holder = CHAR_MAP.index(element)
            @encrypted_message[index] = rot_char_map[index_holder]
          end
        end
      end
      @encrypted_message
    end

    def parsed_message
      @message.split("")
    end
end

if __FILE__ == $0
  @k        = Key.new
  @off      = Offset.new
  @rotator  = Rotator.new(@k, @off)
  @char     = CharacterMapGenerator.new(@rotator)

  encrypt = Encryptor.new(@message, @char)

  encrypt.final_encrypted_message
  encrypt.write_to_file
end
