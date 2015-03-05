require "./lib/rotator"

class Encryption

  attr_reader   :rotator

  attr_accessor :message,
                :encrypted_message

  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize(message)
    @message           = message
    @encrypted_message = []
    @rotator           = Rotator.new
  end

  def parsed_message
    message.split("")
  end

  def encrypt_elements(index_pos, rot_char_map)
    until index_pos > parsed_message.size - 1 do
      parsed_message.map.with_index do |element, index|
        if index == index_pos
          index_pos += 4
          index_holder = CHAR_MAP.index(element)
          encrypted_message[index] = rot_char_map[index_holder]
        end
      end
    end
  end


  def encrypt_a_elements
    index_pos = 0
    encrypt_elements(index_pos, rotator.char_map_rot_a)
  end

  def encrypt_b_elements
    index_pos = 1
    encrypt_elements(index_pos, rotator.char_map_rot_b)
  end


  def encrypt_c_elements
    index_pos = 2
    encrypt_elements(index_pos, rotator.char_map_rot_c)
  end

  def encrypt_d_elements
    index_pos = 3
    encrypt_elements(index_pos, rotator.char_map_rot_d)
  end

  def final_encrypted_message
    encrypt_a_elements
    encrypt_b_elements
    encrypt_c_elements
    encrypt_d_elements
    encrypted_message.join
  end
end

ramble = Encryption.new("rubyrubyruby")
# #
# # ramble.encrypt_a_elements([*("a".."z"), *("0".."9"), " ", ".", ","], ["l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l"])
# # ramble.encrypt_b_elements([*("a".."z"), *("0".."9"), " ", ".", ","], ["r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r"])
# # ramble.encrypt_c_elements([*("a".."z"), *("0".."9"), " ", ".", ","], ["p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"])
# ramble.encrypt_d_elements([*("a".."z"), *("0".."9"), " ", ".", ","], ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0"])
print ramble.final_encrypted_message
