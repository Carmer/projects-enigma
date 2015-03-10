require './lib/decryptor'

class Decrypt

  def run
    @k        = Key.new(ARGV[2])
    @off      = Offset.new(ARGV[3])
    @rotator  = Rotator.new(@k, @off)
    @char     = CharacterMapGenerator.new(@rotator)

    @decrypt   = Decryptor.new(@encrypted_message, @char)

    print File.read(File.join(__dir__, "enigma_logo.txt"))

    @decrypt.final_decrypted_message
    @decrypt.writes
  end
end


d = Decrypt.new

d.run
