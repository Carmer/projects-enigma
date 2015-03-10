require './lib/character_map_generator'
require './lib/writer'
require './lib/printer'

class Encryptor

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize(message = nil, char_map = CharacterMapGenerator.new)
    message ? @message = message : @message = File.read(ARGV[0])
    @writer                  = Writer.new
    @printer                 = Printer.new
    @new_encrypted_message   = ARGV[1]
    @encrypted_message       = []
    @char_map                = char_map
    @done                    = false
  end

  def final_encrypted_message
    encrypt_elements(0, @char_map.a_char_map)
    encrypt_elements(1, @char_map.b_char_map)
    encrypt_elements(2, @char_map.c_char_map)
    encrypt_elements(3, @char_map.d_char_map)
    @encrypted_message.join
  end

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

  def writes
    if @writer.file_exists?(@new_encrypted_message)
      puts @printer.file_exists_message
      until @done == true
        input = $stdin.gets.chomp
        if @writer.overwrite?(input)
          @writer.write_to_file(@new_encrypted_message, @encrypted_message)
          @done = true
        elsif @writer.cancel?(input)
          puts @printer.canceled_message
          @done = true
        else
          puts @printer.options_message
        end
      end
    else @writer.write_to_file(@new_encrypted_message, @encrypted_message)
    end
  end

  private

    def parsed_message
      @message.split("")
    end
end
