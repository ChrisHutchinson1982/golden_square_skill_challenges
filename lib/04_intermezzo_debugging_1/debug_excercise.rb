# debugged this exmaple it using Discovery Debugging 
# ... where used in line 6 rather .. so z was missing

def encode(plaintext, key)
  p "at start of encode plaintext is #{plaintext} and key is #{key}"
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  p "cipher is #{cipher}"
  ciphertext_chars = plaintext.chars.map do |char|
    p "in loop char is #{char}"
    p "code in loop prints #{(65 + cipher.find_index(char)).chr}"
    (65 + cipher.find_index(char)).chr
  end
  p "after loop ciphertext_chars is #{ciphertext_chars}"
  p "encode to return #{ciphertext_chars.join}"
  return ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[65 - char.ord]
  end
  return plaintext_chars.join
end

puts encode("theswiftfoxjumpedoverthelazydog", "secretkey")

puts decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")



# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"