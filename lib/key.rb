class KeyParse

  def initialize
    @key = Array(1..9)
  end

  def key
   #key_values = 5.times.map {key.sample}
   [4,1,5,2,1]
  end

  def key_valid?
    key.size == 5
  end

  def rotate_a
    key[0..1].join.to_i
  end

  def rotate_b
    key[1..2].join.to_i
  end

  def rotate_c
    key[2..3].join.to_i
  end

  def rotate_d
    key[3..4].join.to_i
  end

end
