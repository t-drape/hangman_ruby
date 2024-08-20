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
#   @random_word_array = get_random_word(lines).split('')
#   @@num_guesses = 0
#   @alphabet = [*'a'..'z']

#   game_won = false
#   end_game = false
#   counter = 0
#   guessed_letters = display_letters(@random_word_array).split
#   until @@num_guesses == 7 || game_won == true
#     guess_right = false
#     puts "Available Letters: #{@alphabet}"
#     letter_guess = user_guess(@alphabet)
#     if @random_word_array.include?(letter_guess)
#       guess_right = true
#       @random_word_array.each_with_index do |letter, index|
#         guessed_letters[index] = letter if letter == letter_guess
#         counter += 1 if letter == letter_guess
#       end
#     end
#     @alphabet = @alphabet.reject { |l| l == letter_guess }
#     if guess_right == true
#       game_won = true if counter == @random_word_array.length
#     else
#       display_message(@@num_guesses)
#       @@num_guesses += 1
#       puts @random_word_array.join('') if @@num_guesses == 7
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
  attr_reader :id

  def initialize(name)
    @name = name
    @new_game = false
    @alphabet = [*'a'..'z']
    @num_guesses = 0
    @loaded = false
    @id = 0
    @random_word_array = random_word.split('')
    @guessed_letters = display_letters.split
  end

  def show_guesses
    p @guessed_letters
  end

  def random_word
    lines = read_file
    acceptable_lines = lines.select { |line| line.length > 4 && line.length < 12 }
    acceptable_lines.sample
  end

  def display_letters
    guessed_letters = ''
    @random_word_array.length.times { guessed_letters += '_ ' }
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
    if @loaded
      File.open("game_files/game_#{@id}.yaml", 'w') do |file|
        file.puts YAML.dump(self)
      end
    else
      @loaded = true
      @id += 1 while Dir.children('game_files').include?("game_#{@id}.yaml")
      File.open("game_files/game_#{id}.yaml", 'w') do |file|
        file.puts YAML.dump(self)
      end
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
    game_won = false
    game_over = false
    counter = 0
    until @num_guesses == 7 || game_won == true
      guess_right = false
      puts "Available Letters: #{@alphabet}"
      letter_guess = user_guess
      if @random_word_array.include?(letter_guess)
        guess_right = true
        @random_word_array.each_with_index do |letter, index|
          @guessed_letters[index] = letter if letter == letter_guess
          counter += 1 if letter == letter_guess
        end
      end
      @alphabet = @alphabet.reject { |l| l == letter_guess }
      if guess_right == true
        if counter == @random_word_array.length
          game_won = true
          return
        end
      else
        display_message(@num_guesses)
        @num_guesses += 1
        if @num_guesses == 7
          puts @random_word_array.join('')
          game_over = true
          return
        end
      end
      p @guessed_letters
      next unless game_over == false

      choices = %w[y n]
      puts "\nKeep Playing? [Y, N]"
      answer = gets.chomp.downcase
      answer = gets.chomp unless choices.include?(answer)
      if answer == choices[1] # rubocop:disable Style/Next

        puts 'Game Stopped!'
        dump_data
        return
      end
    end
  end
end

# game = Game.new('j')
# y = Game.new('y')

# game.play_game
#
#
#

if Dir.exist?('game_files')
  puts 'Would you like to resume an old game? [Y, N]'
  answer = gets.chomp.downcase
  if answer == 'y'
    puts 'Which game?'
    puts Dir.children('game_files')
    choice = gets.chomp
    filename = "game_files/#{choice}"
    File.open(filename) do |file|
      game = YAML.unsafe_load(file)
      game.show_guesses
      game.play_game
    end
  else
    puts "What's your name? "
    name = gets.chomp
    game = Game.new(name)
    game.play_game
  end
else
  puts "What's your name? "
  name = gets.chomp
  game = Game.new(name)
  game.play_game
end

# Dir.mkdir('game_files') unless Dir.exist?('game_files')
# filename = 'game_files/game_0.yaml'

# File.open(filename, 'w') do |file|
#   file.puts YAML.dump(game)
# end

# File.open(filename) do |file|
#   game = YAML.unsafe_load(file)
# end

# puts game
