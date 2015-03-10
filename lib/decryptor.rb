require './lib/character_map_generator'
require './lib/writer'

class Decryptor

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize(encrypted_message = nil, char_map)
    encrypted_message ? @encrypted_message = encrypted_message : @encrypted_message = File.read(ARGV[0])
    @w                 = Writer.new
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

  def writer
    if @w.file_exists?(@new_message)
      puts "This file already exists. Do you want to (o)verwrite the file or (c)ancel the operation?"
      until @done == true
        input = $stdin.gets.chomp
        if input.downcase == "o"
          @w.write_to_file(@new_message, @decrypted_message)
          @done = true
          puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}."
        elsif input.downcase == "c"
          puts "Operation Canceled!"
          @done = true
        else
          puts "Enter 'o' to overwrite, or 'c' to cancel."
        end
      end
    else @w.write_to_file(@new_message, @decrypted_message)
      puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}."
    end
  end

  private

    def parsed_message
      @encrypted_message.split("")
    end
end

if __FILE__ == $0
  @k        = Key.new(ARGV[2])
  @off      = Offset.new(ARGV[3])
  @rotator  = Rotator.new(@k, @off)
  @char     = CharacterMapGenerator.new(@rotator)

  decrypt   = Decryptor.new(@encrypted_message, @char)

  print File.read(File.join(__dir__, "enigma_logo.txt"))

  decrypt.final_decrypted_message
  decrypt.writer
end
