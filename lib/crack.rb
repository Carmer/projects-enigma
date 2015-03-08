require './lib/decryptor'

class Crack

  attr_reader   :date

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize(message, date)
    @message     = message
    @offset      = Offset.new(date)
    @cracked     = false
    @brute_key   = 0
  end

  def crack_code
    until cracked?
      puts @brute_key
      key_attempt = @brute_key.to_s.rjust(5, "0").split("")
      @k          = Key.new(key_attempt)
      @rotator    = Rotator.new(@k, @offset)
      @char       = CharacterMapGenerator.new(@rotator)
      @secret     = Decryptor.new(@message, @char)
      @secret.final_decrypted_message
        if @secret.final_decrypted_message[-7..-1] == "..end.."
            @cracked = true
        end
      @brute_key += 1
    end
  end

  def cracked?
    @cracked
  end
end
