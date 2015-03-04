
class TotalRotator

  attr_reader :a_key_value,
              :a_offset_value,
              :b_key_value,
              :b_offset_value,
              :c_key_value,
              :c_offset_value,
              :d_key_value,
              :d_offset_value,
              :char_map

  def initialize(a_key_value, a_offset_value, b_key_value, b_offset_value, c_key_value, c_offset_value, d_key_value, d_offset_value )
    @a_key_value    = a_key_value
    @a_offset_value = a_offset_value
    @b_key_value    = b_key_value
    @b_offset_value = b_offset_value
    @c_key_value    = c_key_value
    @c_offset_value = c_offset_value
    @d_key_value    = d_key_value
    @d_offset_value = d_offset_value
    @char_map       = [*("a".."z"), *("0".."9"), " ", ".", ","]
  end

  def a_final_rotate_value
    a_key_value + a_offset_value
  end

  def b_final_rotate_value
    b_key_value + b_offset_value
  end

  def c_final_rotate_value
    c_key_value + c_offset_value
  end

  def d_final_rotate_value
    d_key_value + d_offset_value
  end

  def char_map_rot_a
    a_char_map = []
    @a = a_final_rotate_value % 39
    until a_char_map.size == 39
      a_char_map.push(char_map[@a])
      @a += 1
      if @a > 37
        @a = 0
      end
    end
    a_char_map
  end

  def char_map_rot_b
    b_char_map = []
    @b = b_final_rotate_value % 39
    until b_char_map.size == 39
      b_char_map.push(char_map[@b])
      @b += 1
      if @b > 37
        @b = 0
      end
    end
    b_char_map
  end

  def char_map_rot_c
    c_char_map = []
    @c = c_final_rotate_value % 39
    until c_char_map.size == 39
      c_char_map.push(char_map[@c])
      @c += 1
      if @c > 37
        @c = 0
      end
    end
    c_char_map
  end

  def char_map_rot_d
    d_char_map = []
    @d = d_final_rotate_value % 39
    until d_char_map.size == 39
      d_char_map.push(char_map[@d])
      @d += 1
      if @d > 37
        @d = 0
      end
    end
    d_char_map
  end
end
