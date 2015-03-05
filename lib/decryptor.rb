require "./lib/rotator"  # ~> LoadError: cannot load such file -- ./lib/rotator

class Decryptor

  attr_reader   :rotator

  attr_accessor :message,
                :decrypted_message


  CHAR_MAP = [*("a".."z"), *("0".."9"), " ", ".", ","]

  def initialize(message)
    @message           = message
    @decrypted_message = []
    @rotator           = Rotator.new
  end

  def parsed_message
    message.split("")
  end

  def decrypt_elements(index_pos, char_map_rot)
    until index_pos > parsed_message.size - 1 do
      parsed_message.map.with_index do |element, index|
        if index == index_pos
          index_pos += 4
          index_holder = char_map_rot.index(element)
          decrypted_message[index] = CHAR_MAP[index_holder]
        end
      end
    end
  end


  def decrypt_a_elements
    index_pos = 0
    decrypt_elements(index_pos, rotator.char_map_rot_a)
  end

  def decrypt_b_elements
    index_pos = 1
    decrypt_elements(index_pos, rotator.char_map_rot_b)
  end


  def decrypt_c_elements
    index_pos = 2
    decrypt_elements(index_pos, rotator.char_map_rot_c)
  end

  def decrypt_d_elements
    index_pos = 3
    decrypt_elements(index_pos, rotator.char_map_rot_d)
  end

  def final_decrypted_message
    decrypt_a_elements
    decrypt_b_elements
    decrypt_c_elements
    decrypt_d_elements
    decrypted_message.join
  end
end

  # d = Decryptor.new
  # d.decrypt_elements


# print d.parsed_message("2.ql2.ql")

# ~> LoadError
# ~> cannot load such file -- ./lib/rotator
# ~>
# ~> /Users/Carmer/.rvm/rubies/ruby-2.0.0-p598/lib/ruby/site_ruby/2.0.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/Carmer/.rvm/rubies/ruby-2.0.0-p598/lib/ruby/site_ruby/2.0.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/Carmer/Documents/Turing/projects/enigma/lib/decryptor.rb:1:in `<main>'
