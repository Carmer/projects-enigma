class CharMapGenerator


  # def rotator_mechanism(encryp_char_map, final_rotate_value)
  #   encryp_char_map = []
  #   var = final_rotate_value % 39
  #   until encryp_char_map.size > 38
  #     encryp_char_map.push(CHAR_MAP[var])
  #     var += 1
  #     if var > 38
  #       var = 0
  #     end
  #   end
  # end

  def char_map_rot_a
    a_char_map = []
    a = a_final_rotate_value % 39
    until a_char_map.size == 39
      a_char_map.push(CHAR_MAP[a])
      a += 1
      if a > 38
        a = 0
      end
    end
    a_char_map
  end

  def char_map_rot_b
    b_char_map = []
    b = b_final_rotate_value % 39
    until b_char_map.size == 39
      b_char_map.push(CHAR_MAP[b])
      b += 1
      if b > 38
        b = 0
      end
    end
    b_char_map
  end

  def char_map_rot_c
    c_char_map = []
    c = c_final_rotate_value % 39
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
    d = d_final_rotate_value % 39
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
