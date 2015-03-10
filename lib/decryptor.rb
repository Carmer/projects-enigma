require './lib/character_map_generator'
require './lib/writer'
require './lib/printer'

class Decryptor

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]


  def initialize(encrypted_message = nil, char_map)
    @encrypted_message = encrypted_message || File.read(ARGV[0])
    @writer            = Writer.new
    @printer           = Printer.new
    @new_message       = ARGV[1]
    @decrypted_message = []
    @char_map          = char_map
    @done              = false
  end

  def final_decrypted_message
    decrypt_elements(0, @char_map.a_char_map)
    decrypt_elements(1, @char_map.b_char_map)
    decrypt_elements(2, @char_map.c_char_map)
    decrypt_elements(3, @char_map.d_char_map)
    @decrypted_message.join
  end

  def decrypt_elements(index_pos, rot_char_map)
    until index_pos > parsed_message.size - 1
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

  def writes
    if @writer.file_exists?(@new_message)
      puts @printer.file_exists_message
      until @done == true
        input = $stdin.gets.chomp
        if @writer.overwrite?(input)
          @writer.write_to_file(@new_message, @decrypted_message)
          @done = true
          puts @printer.overwrite_message(@new_message, ARGV[2], ARGV[3])
        elsif @writer.cancel?(input)
          puts @printer.canceled_message
          @done = true
        else
          puts @printer.options_message
        end
      end
    else @writer.write_to_file(@new_message, @decrypted_message)
      puts @printer.overwrite_message(@new_message, ARGV[2], ARGV[3])
    end
  end

  private

    def parsed_message
      @encrypted_message.split("")
    end
end
