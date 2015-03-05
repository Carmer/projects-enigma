class Key

  attr_reader :key_rotate_a,
              :key_rotate_b,
              :key_rotate_c,
              :key_rotate_c
  def initialize
    @key = Array(1..9)
  end

  def key_gen
   #5.times.map {key.sample}
   [4,1,5,2,1]
  end

  def key_valid?
    key_gen.size == 5
  end

  def key_rotate_a
    key_gen[0..1].join.to_i
  end

  def key_rotate_b
    key_gen[1..2].join.to_i
  end

  def key_rotate_c
    key_gen[2..3].join.to_i
  end

  def key_rotate_d
    key_gen[3..4].join.to_i
  end

end
