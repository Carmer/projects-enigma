require './lib/cracker'

class Crack

  def run
    @c = Cracker.new

    print File.read(File.join(__dir__, "enigma_logo.txt"))

    @c.crack_code
    @c.writes
  end
end

cc = Crack.new

cc.run
