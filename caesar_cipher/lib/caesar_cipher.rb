def caesar_cipher(plaintext, key)
  alphabet = Array('a'..'z')
  downcase_encrypted_letters = Hash[alphabet.zip(alphabet.rotate(key))]

  alphabet.map!(&:upcase)
  encrypted_letters = downcase_encrypted_letters.merge(Hash[alphabet.zip(alphabet.rotate(key))])

  shifted = plaintext.chars.map do |character|
    if /[A-Za-z]/.match(character)
      encrypted_letters[character]
    else
      character
    end
  end

  shifted.join()
end

p caesar_cipher("What a string!", 5)