require './test/test_helper'
require './lib/cracker'

class CrackTest < Minitest::Test

  def setup
    @victory = Cracker.new("o5m8ia3evonyp4syj", "030315")
  end

  def test_it_can_get_crack_the_code
    @victory.crack_code
    assert @victory.cracked?
  end

  def test_it_can_write_to_file
    assert @victory.respond_to?(:writes)
  end
end
