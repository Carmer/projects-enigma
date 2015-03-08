require './lib/rotator'

class CharacterMapGenerator

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize(rotator = Rotator.new )
    @rotator = rotator
  end

  def char_map_rot_a
    a_new_char_map = []
    var = @rotator.a_final_rotate_value % 39
    until a_new_char_map.size == 39
      a_new_char_map.push(CHAR_MAP[var])
      var += 1
      if var > 38
        var = 0
      end
    end
    a_new_char_map
  end

  def char_map_rot_b
    b_char_map = []
    var = @rotator.b_final_rotate_value % 39
    until b_char_map.size == 39
      b_char_map.push(CHAR_MAP[var])
      var += 1
      if var > 38
        var = 0
      end
    end
    b_char_map
  end

  def char_map_rot_c
    c_char_map = []
    c = @rotator.c_final_rotate_value % 39
    until c_char_map.size == 39
      c_char_map.push(CHAR_MAP[c])
      c += 1
      if c > 38
        c = 0
      end
    end
    c_char_map
  end

  def char_map_rot_d
    d_char_map = []
    d = @rotator.d_final_rotate_value % 39
    until d_char_map.size == 39
      d_char_map.push(CHAR_MAP[d])
      d += 1
      if d > 38
        d = 0
      end
    end
    d_char_map
  end


end
