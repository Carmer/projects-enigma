require './lib/character_map_generator'
require './lib/writer'

class Encryptor

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize(message = nil, char_map = CharacterMapGenerator.new)
    message ? @message = message : @message = File.read(ARGV[0])
    @w                       = Writer.new
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

  def writer
    if @w.file_exists?(@new_encrypted_message)
      puts "This file already exists. Do you want to (o)verwrite the file or (c)ancel the operation?"
      until @done == true
        input = $stdin.gets.chomp
        if input.downcase == "o"
          @w.write_to_file(@new_encrypted_message, @encrypted_message)
          @done = true
          puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}."
        elsif input.downcase == "c"
          puts "Operation Canceled!"
          @done = true
        else
          puts "Enter 'o' to overwrite, or 'c' to cancel."
        end
      end
    else write_to_file(@new_encrypted_message)
    end
  end

  private
  
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

  print File.read(File.join(__dir__, "enigma_logo.txt"))

  encrypt.final_encrypted_message
  encrypt.writer

  puts "Created '#{ARGV[1]}' with the key #{@k.key} and date #{@off.date.join}."
end
