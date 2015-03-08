require './test/test_helper'
require './lib/crack'

class CrackTest < Minitest::Test

  def setup
    @victory = Crack.new("o5m8ia3evonyp4syj", "02/03/2015")
  end

  def test_it_can_get_offset_from_date
    assert_equal 9, @victory.gen_offset
  end
end
