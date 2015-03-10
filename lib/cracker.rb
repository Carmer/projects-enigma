require './lib/decryptor'
require './lib/writer'
require './lib/printer'

class Cracker

  def initialize(encrypted_message = nil, date = nil)
    @encrypted_message  = encrypted_message || File.read(ARGV[0])
    @date               = date || ARGV[2]
    @writer             = Writer.new
    @printer            = Printer.new
    @decrypted_message  = ARGV[1]
    @cracked            = false
    @brute_key          = 0
    @done               = false
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

  def writes
    if @writer.file_exists?(@decrypted_message)
      puts @printer.file_exists_message
      until @done == true
        input = $stdin.gets.chomp
        if @writer.overwrite?(input)
          @writer.write_to_file(@decrypted_message, crack_code.split(""))
          puts @printer.overwrite_message(@decrypted_message, @brute_key, @date)
          @done = true
        elsif @writer.cancel?(input)
          puts @printer.canceled_message
          @done = true
        else
          puts @printer.options_message
        end
      end
    else @writer.write_to_file(@decrypted_message, crack_code.split(""))
      puts @printer.overwrite_message(@decrypted_message, @brute_key, @date)
    end
  end
end
