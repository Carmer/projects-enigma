require './lib/key_generator'

class Key

  def initialize(key = KeyGenerator.new.generate_key)
    @key = key
  end

  def key_rotate_a
    @key[0..1].join.to_i
  end

  def key_rotate_b
    @key[1..2].join.to_i
  end

  def key_rotate_c
    @key[2..3].join.to_i
  end

  def key_rotate_d
    @key[3..4].join.to_i
  end

end
