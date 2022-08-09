require 'pry-byebug'



def caesar_cipher(string, shift) 
    alphabets = {
       1 => "a",
       2 => "b",
       3 => "c",
       4 => "d",
       5 => "e",
       6 => "f",
       7 => "g",
       8 => "h",
       9 => "i",
       10 => "j",
       11 => "k",
       12 => "l",
       13 => "m",
       14 => "n",
       15 => "o",
       16 => "p",
       17 => "q",
       18 => "r",
       19 => "s",
       20 => "t",
       21 => "u",
       22 => "v",
       23 => "w",
       24 => "x",
       25 => "y",
       26 => "z",
    }

    original_letters = string.split('')
    
    letters = string.downcase.split('') #Letters lowercased so we can get their positions easily
    
    # Getting indices of characters that are upcase and spaces so that we can add those in same place in the ciphered string
    upcase_indices = []
    space_indices = []

    # For upcases
    original_letters.each_with_index do |ele, index|
        if /[A-Z]/.match(ele)
            upcase_indices << index
        end
    end

    # For spaces
    original_letters.each_with_index do |ele, index|
        if /\s/.match(ele)
            space_indices << index
        end
    end


        # Getting letters' positions in numbers
        letter_places = []
    letters.each do |letter| 
        alphabets.each do |key, value| 
           if value == letter
            letter_places << key
           end
        end
    end

    # Getting letters' shifted positions
    shifted_places = letter_places.map do |letter|
        if letter + shift > 26
            dif = 26 - letter # Difference between letter and z so we can subtract it from shift in order to  get the number we need to get shifted place of the letter from a (or 1).
            letter = shift - dif
        else
            letter += shift
        end
    end
    
    # Getting shifted letters from alphabets hash
    shifted_letters = alphabets.fetch_values(*shifted_places)

    # Adding space for the cipher if any
    space_indices.each do |index|
        shifted_letters.insert(index, " ")
    end

    # Changing letter casing if it was a upcase letter in the original string.
    upcase_indices.each do |index|
        shifted_letters[index] = shifted_letters[index].upcase
    end
        

    cipher = shifted_letters.join("")
end




