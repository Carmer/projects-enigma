require "./lib/offset"
require "./lib/key"
require "./lib/offset"

class Rotator

  attr_reader     :rot_val,
                  :off


  def initialize(key_value = Key.new, offset =  Offset.new)
    @key_val   = key_value
    @off       = offset
  end

  def a_final_rotate_value
    @key_val.key_rotate_a + off.offset_a
  end

  def b_final_rotate_value
    @key_val.key_rotate_b + off.offset_b
  end

  def c_final_rotate_value
    @key_val.key_rotate_c + off.offset_c
  end

  def d_final_rotate_value
    @key_val.key_rotate_d + off.offset_d
  end

end
