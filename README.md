# projects-enigma
<!--
# what the fuck we just did


* Dependency injection/ducks
* SRP
* Designing with testability in mind (separting key generation from slicing the key)

Read args from the command line
  ARGV

ruby ./lib/encrypt.rb message.txt encrypted.txt

ARGV[0] => "message.txt"
output_file = ARGV[0]

File.read('message.txt')
File.write(output_file, ecrypted_message) # first arg is filename, second arg is contents

def message_chars(filename)
  File.read(filename).split
end

# encrypt.rb

original_filename = ARGV[0]
target_file = ARGV[1]

message = File.read(original_filename)
key = KeyGenerator.new_key
date = DateOffset.new_date

encryptor = Encryptor.new(message, key, date)

encrypted_message = enryptor.encrypt

File.write(target_file, encrypted_message) -->
