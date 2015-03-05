require "./lib/offset"
require "./lib/rotator"
require "./lib/decryptor"
require "./lib/key"

class Crack

  attr_reader :off,
              :rotator

  def initialize(message)
    @off     = Offset.new
    @rotator = Rotator.new
    @decrypt = Decryptor.new
    @message = message
  end

  def input_date(date)
    date
  end







end
