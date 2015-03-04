class Offset

  attr_accessor :date

  def initialize(date)
    @date = date
  end

  def sq_date
    date.to_i * date.to_i
  end

  def find_offset_digits
    sq_date.to_s[-4..-1]
  end

  def offset_a
    find_offset_digits[0]
  end

  def offset_b
    find_offset_digits[1]
  end

  def offset_c
    find_offset_digits[2]
  end

  def offset_d
    find_offset_digits[3]
  end

end
