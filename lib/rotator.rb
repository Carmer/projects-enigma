require "./lib/offset"
require "./lib/key"
require "./lib/offset"

class Rotator

  attr_reader     :rot_val,
                  :off

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize
    @rot_val    = Key.new
    @off        = Offset.new
  end

  def a_final_rotate_value
    rot_val.key_rotate_a + off.offset_a
  end

  def b_final_rotate_value
    rot_val.key_rotate_b + off.offset_b
  end

  def c_final_rotate_value
    rot_val.key_rotate_c + off.offset_c
  end

  def d_final_rotate_value
    rot_val.key_rotate_d + off.offset_d
  end


end
