ALPHABET = ('a'..'z').to_a
shifted = []

def shift_alphabet(shift_factor = 0)
    temp = []
    ALPHABET.reverse.select.with_index do |letter, index|
        temp << letter if -index >= -shift_factor +1
    end
    temp = temp.reverse
    temp << ('a'..temp[-1]).to_a
    temp = temp.flatten(1)
    temp.pop
    temp.uniq
end

shifted = shift_alphabet(5)

alphabets_container = [ALPHABET, shifted]

def compare_alphabets(str)
    temp = str.split('')
    temp.each.with_index do |ch, ind|
        ALPHABET.each.with_index do |letter, index|
            puts "Letter #{ch} is in #{index} from Alphabet" if ch == letter
        end        
    end    
end