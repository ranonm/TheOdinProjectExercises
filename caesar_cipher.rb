def caesar_cipher(plaintext, key)
  shifted = plaintext.chars.map do |character|
    if /[A-Za-z]/.match(character)
      shift_character(character, key)
    else
      character
    end
  end

  shifted.join()
end

def shift_character(character, key)
  new_ordinal = character.ord + key
  upperBoundCharacter = /[[:upper:]]/.match(character) ? "Z" : "z"

  if new_ordinal > upperBoundCharacter.ord
    new_ordinal -= 26
  end

  new_ordinal.chr
end

p caesar_cipher("What a string!", 5)