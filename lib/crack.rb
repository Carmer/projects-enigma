require "./lib/offset"
require "./lib/rotator"
# require "./lib/decryptor"

class Crack

  attr_accessor :message,
                :date

  attr_reader  :off,
               :rotator

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize(date, message)
    @rotator     = Rotator.new
    @off         = Offset.new
    @decryptor   = Decryptor.new(message)
    @message     = message
    @date        = date
   # @key_bank    = Array()
  end

  def parsed_message
    message.split("")
  end





end
