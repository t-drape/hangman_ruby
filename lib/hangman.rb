require 'yaml'

# def get_random_word(lines)
#   acceptable_lines = lines.select { |line| line.length > 4 && line.length < 12 }
#   acceptable_lines.sample
# end

# def display_letters(random_word)
#   guessed_letters = ''
#   random_word.length.times { guessed_letters += '_ ' }
#   guessed_letters
# end

# def user_guess(@alphabet)
#   puts "What's your letter guess?"
#   letter_guess = gets.chomp.downcase
#   letter_guess = user_guess(@alphabet) unless @alphabet.include?(letter_guess)
#   letter_guess
# end

# def display_message(number)
#   case number
#   when 0
#     4.times do
#       puts '      |'
#       sleep 0.5
#     end
#   when 1
#     5.times do
#       print '-'
#       sleep 0.5
#     end
#     puts '|'
#     sleep 0.5
#     3.times do
#       puts '     |'
#       sleep 0.5
#     end
#   when 2
#     print ' 0'
#     sleep 0.5
#     5.times do
#       print '-'
#       sleep 0.5
#     end
#     puts '|'
#     sleep 0.5
#     3.times do
#       puts '       |'
#       sleep 0.5
#     end
#   when 3
#     print ' 0'
#     sleep 0.5
#     5.times do
#       print '-'
#       sleep 0.5
#     end
#     puts '|'
#     sleep 0.5
#     puts ' |     |'
#     sleep 0.5
#     2.times do
#       puts '       |'
#       sleep 0.5
#     end

#   when 4
#     print ' 0'
#     sleep 0.5
#     5.times do
#       print '-'
#       sleep 0.5
#     end
#     puts '|'
#     sleep 0.5
#     print '-'
#     sleep 0.5
#     print '|'
#     sleep 0.5
#     print '-'
#     sleep 0.5
#     puts '    |'
#     sleep 0.5
#     puts '       |'
#     sleep 0.5
#     puts '       |'

#   when 5
#     print ' 0'
#     sleep 0.5
#     5.times do
#       print '-'
#       sleep 0.5
#     end
#     puts '|'
#     sleep 0.5
#     print '-'
#     sleep 0.5
#     print '|'
#     sleep 0.5
#     print '-'
#     sleep 0.5
#     puts '    |'
#     sleep 0.5
#     print ' +'
#     sleep 0.5
#     puts '     |'
#     sleep 0.5
#     puts '       |'

#   when 6
#     print ' 0'
#     sleep 0.5
#     5.times do
#       print '-'
#       sleep 0.5
#     end
#     puts '|'
#     sleep 0.5
#     print '-'
#     sleep 0.5
#     print '|'
#     sleep 0.5
#     print '-'
#     sleep 0.5
#     puts '    |'
#     sleep 0.5
#     print '_'
#     sleep 0.5
#     print '+'
#     sleep 0.5
#     print '_'
#     sleep 0.5
#     puts '    |'
#     sleep 0.5
#     puts '       |'
#   end
# end

# def play_game
#   lines = File.readlines('google-10000-english.txt')
#   lines = lines.map(&:chomp)
#   random_word_array = get_random_word(lines).split('')
#   num_guesses = 0
#   @alphabet = [*'a'..'z']

#   game_won = false
#   end_game = false
#   counter = 0
#   guessed_letters = display_letters(random_word_array).split
#   until num_guesses == 7 || game_won == true
#     guess_right = false
#     puts "Available Letters: #{@alphabet}"
#     letter_guess = user_guess(@alphabet)
#     if random_word_array.include?(letter_guess)
#       guess_right = true
#       random_word_array.each_with_index do |letter, index|
#         guessed_letters[index] = letter if letter == letter_guess
#         counter += 1 if letter == letter_guess
#       end
#     end
#     @alphabet = @alphabet.reject { |l| l == letter_guess }
#     if guess_right == true
#       game_won = true if counter == random_word_array.length
#     else
#       display_message(num_guesses)
#       num_guesses += 1
#       puts random_word_array.join('') if num_guesses == 7
#     end
#     p guessed_letters
#     choices = %w[y n]
#     puts "\nKeep Playing? [Y, N]"
#     answer = gets.chomp.downcase
#     answer = gets.chomp unless choices.include?(answer)
#     if answer == choices[1]
#       puts 'Game Stopped!'
#       break
#     end

#   end
# end

# play_game

# Class to represent Game of Hangman
class Game
  @@unique_game_ids = 0

  def self.update
    @@unique_game_ids += 1
  end

  attr_reader :id

  def initialize(name)
    @name = name
    @new_game = false
    @alphabet = [*'a'..'z']
    @id = @@unique_game_ids
    Game.update
  end

  def get_random_word(lines)
    acceptable_lines = lines.select { |line| line.length > 4 && line.length < 12 }
    acceptable_lines.sample
  end

  def display_letters(random_word)
    guessed_letters = ''
    random_word.length.times { guessed_letters += '_ ' }
    guessed_letters
  end

  def user_guess
    puts "What's your letter guess?"
    letter_guess = gets.chomp.downcase
    letter_guess = user_guess unless @alphabet.include?(letter_guess)
    letter_guess
  end

  def read_file
    lines = File.readlines('google-10000-english.txt')
    lines.map(&:chomp)
  end

  def dump_data
    Dir.mkdir('game_files') unless Dir.exist?('game_files')
    filename = "game_files/game_#{id}.yaml"
    File.open(filename, 'w') do |file|
      file.puts YAML.dump(self)
    end
  end

  def display_message(number)
    case number
    when 0
      4.times do
        puts '      |'
        sleep 0.5
      end
    when 1
      5.times do
        print '-'
        sleep 0.5
      end
      puts '|'
      sleep 0.5
      3.times do
        puts '     |'
        sleep 0.5
      end
    when 2
      print ' 0'
      sleep 0.5
      5.times do
        print '-'
        sleep 0.5
      end
      puts '|'
      sleep 0.5
      3.times do
        puts '       |'
        sleep 0.5
      end
    when 3
      print ' 0'
      sleep 0.5
      5.times do
        print '-'
        sleep 0.5
      end
      puts '|'
      sleep 0.5
      puts ' |     |'
      sleep 0.5
      2.times do
        puts '       |'
        sleep 0.5
      end

    when 4
      print ' 0'
      sleep 0.5
      5.times do
        print '-'
        sleep 0.5
      end
      puts '|'
      sleep 0.5
      print '-'
      sleep 0.5
      print '|'
      sleep 0.5
      print '-'
      sleep 0.5
      puts '    |'
      sleep 0.5
      puts '       |'
      sleep 0.5
      puts '       |'

    when 5
      print ' 0'
      sleep 0.5
      5.times do
        print '-'
        sleep 0.5
      end
      puts '|'
      sleep 0.5
      print '-'
      sleep 0.5
      print '|'
      sleep 0.5
      print '-'
      sleep 0.5
      puts '    |'
      sleep 0.5
      print ' +'
      sleep 0.5
      puts '     |'
      sleep 0.5
      puts '       |'

    when 6
      print ' 0'
      sleep 0.5
      5.times do
        print '-'
        sleep 0.5
      end
      puts '|'
      sleep 0.5
      print '-'
      sleep 0.5
      print '|'
      sleep 0.5
      print '-'
      sleep 0.5
      puts '    |'
      sleep 0.5
      print '_'
      sleep 0.5
      print '+'
      sleep 0.5
      print '_'
      sleep 0.5
      puts '    |'
      sleep 0.5
      puts '       |'
    end
  end

  def play_game
    lines = read_file
    random_word_array = get_random_word(lines).split('')
    num_guesses = 0
    @alphabet = [*'a'..'z']

    game_won = false
    end_game = false
    counter = 0
    guessed_letters = display_letters(random_word_array).split
    until num_guesses == 7 || game_won == true
      guess_right = false
      puts "Available Letters: #{@alphabet}"
      letter_guess = user_guess
      if random_word_array.include?(letter_guess)
        guess_right = true
        random_word_array.each_with_index do |letter, index|
          guessed_letters[index] = letter if letter == letter_guess
          counter += 1 if letter == letter_guess
        end
      end
      @alphabet = @alphabet.reject { |l| l == letter_guess }
      if guess_right == true
        game_won = true if counter == random_word_array.length
      else
        display_message(num_guesses)
        num_guesses += 1
        puts random_word_array.join('') if num_guesses == 7
      end
      p guessed_letters
      choices = %w[y n]
      puts "\nKeep Playing? [Y, N]"
      answer = gets.chomp.downcase
      answer = gets.chomp unless choices.include?(answer)
      next unless answer == choices[1]

      puts 'Game Stopped!'
      dump_data
      break

    end
  end
end

game = Game.new('j')
y = Game.new('y')

game.play_game

# Dir.mkdir('game_files') unless Dir.exist?('game_files')
filename = 'game_files/game_0.yaml'

# File.open(filename, 'w') do |file|
#   file.puts YAML.dump(game)
# end

File.open(filename) do |file|
  game = YAML.unsafe_load(file)
end

puts game
