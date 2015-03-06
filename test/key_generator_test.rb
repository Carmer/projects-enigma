require './test/test_helper'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_it_has_random_key
    k = KeyGenerator.new
    sample = []
    10.times {k.generate_key << sample}
    assert sample.uniq
  end
end
