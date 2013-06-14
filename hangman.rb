#grabs random dictionary word
word = IO.readlines('dictionary.txt').sample
word.chomp!
word.downcase!

#Correct guesses string
correctGuesses = ""

#gets user input
guess = gets
guess.chomp!

#makes sure the input is only one letter
while (guess.size != 1)
    puts 'Invalid guess.  Please try again.'
    guess = gets
    guess.chomp!
end

# Displays the word and if the letter is in the word for debug
puts word
puts word.include? guess

# Adds to correct letter list
if word.include? guess
    correctGuesses << guess
end

# Iterates over the word and displays correct guesses.
word.split("").each do |i|
    if correctGuesses.include? i
        print i
    else
        print "_"
    end
    print " "
end

# Endline
print "\n"