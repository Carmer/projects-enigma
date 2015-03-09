require './lib/rotator'

class CharacterMapGenerator

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize(rotator = Rotator.new)
    @rotator = rotator
  end

  def a_char_map
    char_map_generation_mechanism(@rotator.a_final_rotate_value)
  end

  def b_char_map
    char_map_generation_mechanism(@rotator.b_final_rotate_value)
  end

  def c_char_map
    char_map_generation_mechanism(@rotator.c_final_rotate_value)
  end

  def d_char_map
    char_map_generation_mechanism(@rotator.d_final_rotate_value)
  end

  private

    def char_map_generation_mechanism(final_rotation_value)
      new_char_map = []
      var = final_rotation_value % 39
      until new_char_map.size == 39
        new_char_map.push(CHAR_MAP[var])
        var += 1
        if var > 38
          var = 0
        end
      end
      new_char_map
    end
end
