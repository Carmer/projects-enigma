class KeyGenerator

  def initialize
    @key_bank = Array(1..9)
  end

  def generate_key
    5.times.map {@key_bank.sample}
  end
end
