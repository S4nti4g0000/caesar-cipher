ALPHABET = ('a'..'z').to_a

def shift_alphabet(shift_factor)
    temp = []
    ALPHABET.reverse.select.with_index do |letter, index|
        temp << letter if -index >= -shift_factor +1
    end
    temp = temp.reverse
    temp << ('a'..temp[-1]).to_a
    temp = temp.flatten(1)
    temp.pop
    temp
end

