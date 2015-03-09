require './lib/decryptor'

class Crack

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize(encrypted_message = nil, date = nil)
    encrypted_message ? @encrypted_message = encrypted_message : @encrypted_message = File.read(ARGV[0])
    date ? @date = date : @date = ARGV[2]
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

  def write_to_file
    output         = File.open(@decrypted_message, "w")
    decrypted_text = crack_code
    output.write(decrypted_text)
    output.close
  end
end

if __FILE__ == $0
  c = Crack.new
  c.crack_code
  c.write_to_file
end
