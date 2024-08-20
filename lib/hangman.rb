def get_random_word(lines)
  acceptable_lines = lines.select { |line| line.length > 4 && line.length < 12 }
  acceptable_lines.sample
end

def display_letters(random_word)
  guessed_letters = ""
  random_word.length.times {guessed_letters += "_ "}
  guessed_letters
end

def user_guess(alphabets)
  puts "What's your letter guess?"
  letter_guess = gets.chomp.downcase
  letter_guess = user_guess(alphabets) unless alphabets.include?(letter_guess)
  letter_guess

end

def display_message(number)
  case number
  when 0 
    4.times do 
      puts "      |"
      sleep 0.5
    end
  when 1
    5.times do 
      print "-"
      sleep 0.5
    end
    puts "|"
    sleep 0.5
    3.times do
      puts "     |"
      sleep 0.5
    end
  when 2
    print " 0"
    sleep 0.5
    5.times do 
      print "-"
      sleep 0.5
    end
    puts "|"
    sleep 0.5
    3.times do
      puts "       |"
      sleep 0.5
    end
  when 3
    print " 0"
    sleep 0.5
    5.times do 
      print "-"
      sleep 0.5
    end
    puts "|"
    sleep 0.5
    puts " |     |"
    sleep 0.5
    2.times do
      puts "       |"
      sleep 0.5
    end
  
  when 4
    print " 0"
    sleep 0.5
    5.times do 
      print "-"
      sleep 0.5
    end
    puts "|"
    sleep 0.5
    print "-"
    sleep 0.5
    print "|"
    sleep 0.5
    print "-"
    sleep 0.5
    puts "    |"
    sleep 0.5
    puts "       |"
    sleep 0.5
    puts "       |"

  when 5
    print " 0"
    sleep 0.5
    5.times do 
      print "-"
      sleep 0.5
    end
    puts "|"
    sleep 0.5
    print "-"
    sleep 0.5
    print "|"
    sleep 0.5
    print "-"
    sleep 0.5
    puts "    |"
    sleep 0.5
    print " +"
    sleep 0.5
    puts "     |"
    sleep 0.5
    puts "       |"

  when 6
    print " 0"
    sleep 0.5
    5.times do 
      print "-"
      sleep 0.5
    end
    puts "|"
    sleep 0.5
    print "-"
    sleep 0.5
    print "|"
    sleep 0.5
    print "-"
    sleep 0.5
    puts "    |"
    sleep 0.5
    print "_"
    sleep 0.5
    print "+"
    sleep 0.5
    print "_"
    sleep 0.5
    puts "    |"
    sleep 0.5
    puts "       |"
  end
  
end


def play_game

  lines = File.readlines('google-10000-english.txt')
  lines = lines.map {|line| line.chomp}
  random_word_array = get_random_word(lines).split("")
  num_guesses = 0
  alphabets = [*"a".."z"]

  game_won = false
  guess_right = false
  counter = 0
  random_word_array = get_random_word(lines).split("")
  guessed_letters = display_letters(random_word_array).split
  until num_guesses == 7 || game_won == true
    guess_right = false
    puts "Available Letters: #{alphabets}"
    letter_guess = user_guess(alphabets)
    if random_word_array.include?(letter_guess)
      guess_right = true
      random_word_array.each_with_index do |letter, index|
        guessed_letters[index] = letter if letter == letter_guess
        counter += 1 if letter == letter_guess
      end
    end
    alphabets = alphabets.select {|l| l != letter_guess}
    if guess_right == true
      if counter == random_word_array.length
        game_won = true
      end
    else
      display_message(num_guesses)
      num_guesses += 1
      puts random_word_array.join("") if num_guesses == 7
    end
    p guessed_letters
  end
end

play_game