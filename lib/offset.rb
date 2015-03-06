class Offset

  def initialize(date = Time.now.strftime("%m/%d/%Y"))
    @date = date.split("/")
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

  private

    def date_parsed
      holder = @date.join
      date = []
      date.push(holder[0..1])
      date.push(holder[2..3])
      date.push(holder[-2..-1])
      date.join
    end

    def sq_date
      date_parsed.to_i * date_parsed.to_i
    end

    def find_offset_digits
      sq_date.to_s[-4..-1]
    end

end
