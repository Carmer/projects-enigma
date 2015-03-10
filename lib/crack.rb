require './lib/decryptor'
require './lib/writer'

class Crack

  def initialize(encrypted_message = nil, date = nil)
    encrypted_message ? @encrypted_message = encrypted_message : @encrypted_message = File.read(ARGV[0])
    date ? @date = date : @date = ARGV[2]
    @w                  = Writer.new
    @decrypted_message  = ARGV[1]
    @cracked            = false
    @brute_key          = 0
  end

  def crack_code
    until cracked?
      @brute_key
      key_attempt = @brute_key.to_s.rjust(5, "0")
      @k          = Key.new(key_attempt)
      @off        = Offset.new(@date)
      @rotator    = Rotator.new(@k, @off)
      @char       = CharacterMapGenerator.new(@rotator)
      @secret     = Decryptor.new(@encrypted_message, @char)
      @secret.final_decrypted_message
        if @secret.final_decrypted_message[-7..-1] == "..end.."
            @cracked = true
        end
      @brute_key += 1
    end
    @secret.final_decrypted_message
  end

  def cracked?
    @cracked
  end

  def writer
    if @w.file_exists?(@decrypted_message)
      puts "This file already exists. Do you want to (o)verwrite the file or (c)ancel the operation?"
      until @done == true
        input = $stdin.gets.chomp
        if input.downcase == "o"
          @w.write_to_file(@decrypted_message, crack_code.split(""))
          @done = true
          puts "Created '#{ARGV[1]}' with the key #{@brute_key} and date #{ARGV[2]}."
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

end

if __FILE__ == $0

  c = Crack.new

  print File.read(File.join(__dir__, "enigma_logo.txt"))

  c.crack_code
  c.writer
end
