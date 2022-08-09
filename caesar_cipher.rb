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

    original_letters = string.downcase.split('')

    letter_places = []
    
    original_letters.each do |letter| 
        alphabets.each do |key, value| 
           if value == letter
            letter_places << key
           end
        end
    end

    shifted_places = letter_places.map do |letter|
        if letter + shift > 26
            dif = 26 - letter # Difference between letter and z so we can subtract it from shift in order to  get the number we need to get shifted place of the letter from a.
            letter = shift - dif
        else
            letter += shift
        end
    end
    
    shifted_letters = alphabets.fetch_values(*shifted_places) #getting values from alphabets after shifting them numerically
    
    
    
    
    
    
    
    
    binding.pry
end




caesar_cipher("Hellz", 5)