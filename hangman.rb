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
while !win && !(wrongGuesses.size > 4)

    #gets user input
    print "Please make a guess: "
    guess = gets
    guess.chomp!
    guess.downcase!

    #makes sure the input is only one letter
    while !(/^[a-z]$/.match(guess))
        puts "Invalid guess.  Please try again."
        print "Please make a guess: "
        guess = gets
        guess.chomp!
        guess.downcase!
    end

    # Displays the word and if the letter is in the word for debug
    puts word
    puts word.include? guess

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