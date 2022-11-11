# debugged this exmaple it using Discovery Debugging 
# ... where used in line 6 rather .. so z was missing

def encode(plaintext, key)
  # p "at start of encode plaintext is #{plaintext} and key is #{key}"
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  # p "cipher is #{cipher}"
  ciphertext_chars = plaintext.chars.map do |char|
    # p "in loop char is #{char}"
    # p "code in loop prints #{(65 + cipher.find_index(char)).chr}"
    (65 + cipher.find_index(char)).chr
  end
  # p "after loop ciphertext_chars is #{ciphertext_chars}"
  # p "encode to return #{ciphertext_chars.join}"
  return ciphertext_chars.join
end

def decode(ciphertext, key)
  # p "at start of decode ciphertext is #{ciphertext} and key is #{key}"
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  # p "cipher is #{cipher}"
  plaintext_chars = ciphertext.chars.map do |char|
    p "in loop char is #{char}"
    p "code in loop prints #{cipher[char.ord - 65]}"
    cipher[char.ord - 65]
  end
  p "after loop plaintext_chars is #{plaintext_chars}"
  p "encode to return #{plaintext_chars.join}"
  return plaintext_chars.join
end

# puts encode("theswiftfoxjumpedoverthelazydog", "secretkey")

puts decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")

# => "theswiftfoxjumpedoverthelazydog"

# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"