require 'pry'

class Encryption

  attr_accessor :message,
                :encrypted_message

  def initialize(message)
    @message = message
    @encrypted_message = []
  end

  def parsed_message
    message.split("")
  end

  def encrypt_a_elements(char_map, char_map_rot_a)
    @index_pos = 0
    until @index_pos > parsed_message.size - 1
    parsed_message.each_with_index do |element, index|
        if index == @index_pos
          @index_pos += 4
          index_holder = char_map.index(element)
          encrypted_message.insert(index, char_map_rot_a[index_holder])
        end
      end
    end
    # print encrypted_message
  end

  def encrypt_b_elements(char_map, char_map_rot_b)
    @index_pos = 1
    until @index_pos > parsed_message.size - 1
    parsed_message.each_with_index do |element, index|
        if index == @index_pos
          @index_pos += 4
          index_holder = char_map.index(element)
          encrypted_message.insert(index, char_map_rot_b[index_holder])
        end
      end
    end
    # print encrypted_message
  end


def encrypt_c_elements(char_map, char_map_rot_c)
  @index_pos = 2
  until @index_pos > parsed_message.size - 1
  parsed_message.each_with_index do |element, index|
      if index == @index_pos
        @index_pos += 4
        index_holder = char_map.index(element)
        encrypted_message.insert(index, char_map_rot_c[index_holder])
      end
    end
  end
  # print encrypted_message
end

  def encrypt_d_elements(char_map, char_map_rot_d)
    @index_pos = 3
    until @index_pos > parsed_message.size - 1
    parsed_message.each_with_index do |element, index|
        if index == @index_pos
          @index_pos += 4
          index_holder = char_map.index(element)
          encrypted_message.insert(index, char_map_rot_d[index_holder])
        end
      end
    end
    # print encrypted_message
  end

  def final_encrypted_message
    encrypt_a_elements([*("a".."z"), *("0".."9"), " ", ".", ","], ["l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l"])
    encrypt_b_elements([*("a".."z"), *("0".."9"), " ", ".", ","], ["r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r"])
    encrypt_c_elements([*("a".."z"), *("0".."9"), " ", ".", ","], ["p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"])
    encrypt_d_elements([*("a".."z"), *("0".."9"), " ", ".", ","], ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0"])
    @encrypted_message.compact
  end
end

ramble = Encryption.new("this is a message.")
#
# ramble.encrypt_a_elements([*("a".."z"), *("0".."9"), " ", ".", ","], ["l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l"])
# ramble.encrypt_b_elements([*("a".."z"), *("0".."9"), " ", ".", ","], ["r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r"])
# ramble.encrypt_c_elements([*("a".."z"), *("0".."9"), " ", ".", ","], ["p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"])
# ramble.encrypt_d_elements([*("a".."z"), *("0".."9"), " ", ".", ","], ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0"])
print ramble.final_encrypted_message
