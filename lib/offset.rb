class Offset
  attr_reader   :offset_a,
                :offset_b,
                :offset_c,
                :offset_d

  attr_accessor :date

#  Time.now.strftime("%m/%d/%Y")
  def initialize(date = "03/03/2015")
    @date = date.split("/")
  end

  def date_parsed
    date.replace([date[0],date[1],date[2][-2..-1]]).join.to_i
  end

  def sq_date
    date_parsed * date_parsed
  end

  def find_offset_digits
    sq_date.to_s[-4..-1]
  end

  def offset_a
    find_offset_digits[0].to_i
  end

  def offset_b
    find_offset_digits[1].to_i
  end

  def offset_c
    find_offset_digits[2].to_i
  end

  def offset_d
    find_offset_digits[3].to_i
  end

end

# off = Offset.new
#
# print off.sq_date
