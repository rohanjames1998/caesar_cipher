class CaesarCipher
  def encrypt(string, shift)
    original_letters = string.split('')

    letters = string.downcase.split('') # Letters lowercased so we can get their positions easily

    # Getting letters' positions in numbers
    letter_places = []
    letters.each do |letter|
      if /[a-z]/.match(letter)
        letter_places << letter.ord
      end
    end

    # Getting indices for special characters such as space and upper case
    # letters
    special_char_indices = {}
    original_letters.each_with_index do |chr, index|
      if /[A-Z]/.match(chr)
        special_char_indices[index] = 'U'
      elsif !/[A-Za-z]/.match(chr)
        special_char_indices[index] = chr
      end
    end

    # Getting letters' shifted positions
    shifted_places = letter_places.map do |letter|
      if letter + shift > 122
        dif = 122 - letter # Difference between letter and z so we can subtract it from shift
        # in order to  get the number we need to get shifted place of the letter from a (or 1).
        letter = 96 + (shift - dif)
      else
        letter += shift
      end
    end

    # Getting shifted letters from alphabets hash
    shifted_letters = []
    shifted_places.each do |ascii|
      shifted_letters << ascii.chr
    end

    # Adding special characters to our shifted_letters array
    special_char_indices.each do |k, v|
      if v == 'U'
        shifted_letters[k].upcase!
      else
        shifted_letters.insert(k, v)
      end
    end

    cypher = shifted_letters.join("")
  end
end
