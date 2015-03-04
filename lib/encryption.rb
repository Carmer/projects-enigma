class Encryption

  attr_accessor :message

  def initialize(message)
    @message = message
  end

  def parse_message
    message.split("")
  end

  def encrypt_elements(a_final_rotate, b_final_rotate, c_final_rotate, d_final_rotate)

  end


end
