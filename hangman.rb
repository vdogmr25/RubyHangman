# Takes the number of wrong guesses and prints the correct hangman to represent it.
def display_hangman (numWrong)
    if numWrong == 0
        puts "----------"
        puts "|        |"
        puts "|"
        puts "|"
        puts "|"
        puts "|"
        puts "|"
        puts "|"
        puts "|"
        puts "|"
        puts "|"
        puts "|"
        puts "----------"
    elsif numWrong == 1
        puts "----------"
        puts "|        |"
        puts "|        O"
        puts "|"
        puts "|"
        puts "|"
        puts "|"
        puts "|"
        puts "|"
        puts "|"
        puts "|"
        puts "|"
        puts "----------"
    elsif numWrong == 2
        puts "----------"
        puts "|        |"
        puts "|        O"
        puts "|        |"
        puts "|        |"
        puts "|        |"
        puts "|        |"
        puts "|        |"
        puts "|"
        puts "|"
        puts "|"
        puts "|"
        puts "----------"
    elsif numWrong == 3
        puts "----------"
        puts "|        |"
        puts "|        O"
        puts "|        |"
        puts "|       /|"
        puts "|      / |"
        puts "|        |"
        puts "|        |"
        puts "|"
        puts "|"
        puts "|"
        puts "|"
        puts "----------"
    elsif numWrong == 4
        puts "----------"
        puts "|        |"
        puts "|        O"
        puts "|        |"
        puts "|       /|\\"
        puts "|      / | \\"
        puts "|        |"
        puts "|        |"
        puts "|"
        puts "|"
        puts "|"
        puts "|"
        puts "----------"
    elsif numWrong == 5
        puts "----------"
        puts "|        |"
        puts "|        O"
        puts "|        |"
        puts "|       /|\\"
        puts "|      / | \\"
        puts "|        |"
        puts "|        |"
        puts "|       /"
        puts "|      /"
        puts "|     /"
        puts "|"
        puts "----------"
    elsif numWrong == 6
        puts "----------"
        puts "|        |"
        puts "|        O"
        puts "|        |"
        puts "|       /|\\"
        puts "|      / | \\"
        puts "|        |"
        puts "|        |"
        puts "|       / \\"
        puts "|      /   \\"
        puts "|     /     \\"
        puts "|"
        puts "----------"
    end
end

#grabs random dictionary word
word = IO.readlines('dictionary.txt').sample
word.chomp!
word.downcase!

#Guesses strings
correctGuesses = ""
wrongGuesses = ""

#Win check
win = false

#Loops until game is done.
while !win && !(wrongGuesses.size > 5)

    display_hangman(wrongGuesses.size)

    #gets user input
    print "Please make a guess: "
    guess = gets
    guess.chomp!
    guess.downcase!

    #makes sure the input is only one letter or not already guessed.
    while (!(/^[a-z]$/.match(guess)) || (correctGuesses.include? guess) || (wrongGuesses.include? guess))
        puts "Invalid guess.  Please try again."
        print "Please make a guess: "
        guess = gets
        guess.chomp!
        guess.downcase!
    end

    # Displays the word and if the letter is in the word for debug
    #puts word
    #puts word.include? guess

    # Adds the guess to the proper letter list
    if word.include? guess
        correctGuesses << guess
    else
        wrongGuesses << guess
    end

    # Iterates over the word and displays correct guesses.
    win = true
    word.split("").each do |i|
        if correctGuesses.include? i
            print i
        else
            print "_"
            win = false
        end
        print " "
    end

    # Endline
    print "\n"

    # Prints the wrong guesses
    print "Incorrect Guesses: "
    wrongGuesses.split("").each do |i|
        print i + " "
    end
    print "\n"
end

#If the player won
if win
    #Congratulate
    puts "You Win!"
else
    #Otherwise, display the full hangman and give the game over message and word.
    display_hangman(wrongGuesses.size)
    puts "\nGame Over."
    print "The word was: "
    puts word
end