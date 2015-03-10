require './lib/encryptor'

class Encrypt

  def run
    @k        = Key.new
    @off      = Offset.new
    @rotator  = Rotator.new(@k, @off)
    @char     = CharacterMapGenerator.new(@rotator)
    @printer  = Printer.new

    @encrypt = Encryptor.new(@message, @char)

    print File.read(File.join(__dir__, "enigma_logo.txt"))

    @encrypt.final_encrypted_message
    @encrypt.writes

    puts @printer.overwrite_message(ARGV[1], @k.key, @off.date.join)
  end
end

e = Encrypt.new

e.run
