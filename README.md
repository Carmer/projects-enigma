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

"___           ___                       ___           ___           ___
/  /\         /__/\        ___          /  /\         /__/\         /  /\
/  /:/_        \  \:\      /  /\        /  /:/_       |  |::\       /  /::\
/  /:/ /\        \  \:\    /  /:/       /  /:/ /\      |  |:|:\     /  /:/\:\
/  /:/ /:/_   _____\__\:\  /__/::\      /  /:/_/::\   __|__|:|\:\   /  /:/~/::\
/__/:/ /:/ /\ /__/::::::::\ \__\/\:\__  /__/:/__\/\:\ /__/::::| \:\ /__/:/ /:/\:\
\  \:\/:/ /:/ \  \:\~~\~~\/    \  \:\/\ \  \:\ /~~/:/ \  \:\~~\__\/ \  \:\/:/__\/
\  \::/ /:/   \  \:\  ~~~      \__\::/  \  \:\  /:/   \  \:\        \  \::/
\  \:\/:/     \  \:\          /__/:/    \  \:\/:/     \  \:\        \  \:\
\  \::/       \  \:\         \__\/      \  \::/       \  \:\        \  \:\
\__\/         \__\/                     \__\/         \__\/         \__\/

                888                                                888
                888                                                888
                888                                                888
.d8888b .d88b.   .d88888  .d88b.        .d8888b 888d888 8888b.   .d8888b 888  888  .d88b.  888d888
d88P"   d88""88b d88" 888 d8P  Y8b      d88P"    888P"      "88b d88P"    888 .88P d8P  Y8b 888P"
888     888  888 888  888 88888888      888      888    .d888888 888      888888K  88888888 888
Y88b.   Y88..88P Y88b 888 Y8b.          Y88b.    888    888  888 Y88b.    888 "88b Y8b.     888
"Y8888P "Y88P"   "Y88888  "Y8888        "Y8888P 888    "Y888888  "Y8888P 888  888  "Y8888  888

.
..
...
"

Enigma will encrypt your secret message and write your message inside a specified file.

Enter the following Input in your terminal, and you will receive the following output:

Input:
ruby ./lib/encrypt.rb example_message.txt example_encrypted_message.txt

Output: Created 'example_encrypted_message.txt' with the key 82648 and date 030815.
the key is randomly generated and the date is the current date.

Enigma will also decrypt your message. To decrypt the message contained inside a file, and to save the decrypted message inside a file  different file, enter the following Input in your terminal. You will receive the following output.

Input:
ruby ./lib/decrypt.rb encrypted_example_message.txt decrypted_example_message.txt 82648 030815

(The last two entered elements are the key and the date which you will need to specify in order to decrypt the message.)

Output: Created 'decrypted_example_message.txt' with the key 82648 and date 030815

Enigma will also crack a code. All you need to know the date of the transmitted message. To crack a message contained inside a file, and to save the decrypted message inside a different file, enter the following into your terminal.

Input:
ruby ./lib/crack.rb encrypted_example_message.txt cracked_example_message.txt 030815

Output: Created 'cracked_example_message.txt' with the key (key found from cracking code) and date 030815



**Good luck! And have fun cracking those secret messages!!
