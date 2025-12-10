ALPHABET = ('a'..'z').to_a

def shift_alphabet(shift_factor = 0)
    temp = []
    ALPHABET.select.with_index do |letter, index|
        temp << letter if -index >= -shift_factor
    end
    temp.unshift((temp[-1]..'z').to_a)    
    temp = temp.flatten(1)
    temp.pop
    temp.uniq
end


def cipher_string(str, factor)
    shifted = shift_alphabet(factor)
    temp = str.downcase.split('')

    indexes = []
    new_string = []

    temp.each.with_index do |ch, ind|
        ALPHABET.each.with_index do |letter, index|
            indexes << index if ch == letter            
        end        
    end    

    indexes.each do |ind|
        shifted.each.with_index do |letter, index|
            new_string << letter if ind == index
        end
    end

    temp.each.with_index do |element, index|
        new_string.insert(index, element) if element == " " || element == "!" || element == "," || element == "."
        
    end

    new_string = new_string.map.with_index do |ch, i|
        str[i] =~ /[A-Z]/ ? ch.upcase : ch
    end

    new_string.join('')

end

cipher_string("What a string!", 5)