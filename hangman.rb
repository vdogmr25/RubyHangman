#grabs random dictionary word
word = IO.readlines('dictionary.txt').sample

guess = gets
guess.chomp!
while (guess.size != 1)
    puts 'Invalid guess.  Please try again.'
    guess = gets
    guess.chomp!
end

puts word
puts word.include? guess