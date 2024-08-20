require 'yaml'

require_relative('display')

# Class to represent Game of Hangman
class Game
  include Display
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
    @guess_right = false
    @winner = false
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

  def write_file
    File.open("game_files/game_#{@id}.yaml", 'w') do |file|
      file.puts YAML.dump(self)
    end
  end

  def dump_data
    Dir.mkdir('game_files') unless Dir.exist?('game_files')
    unless @loaded
      @loaded = true
      @id += 1 while Dir.children('game_files').include?("game_#{@id}.yaml")
    end
    write_file
  end

  def continue_playing
    choices = %w[y n]
    puts "\nKeep Playing? [Y, N]"
    answer = gets.chomp.downcase
    answer = gets.chomp unless choices.include?(answer)
    answer == choices[0]
  end

  def update_data(counter, letter_guess)
    @random_word_array.each_with_index do |letter, index|
      @guessed_letters[index] = letter if letter == letter_guess
      counter += 1 if letter == letter_guess
    end
    @guess_right = true
    counter
  end

  def play_round(counter)
    @guess_right = false
    puts "Available Letters: #{@alphabet}"
    letter_guess = user_guess
    counter = update_data(counter, letter_guess) if @random_word_array.include?(letter_guess)
    @alphabet = @alphabet.reject { |l| l == letter_guess }
    counter
  end

  def game_finished(counter)
    if @guess_right == true
      if counter == @random_word_array.length
        @winner = true
        true
      end
    else
      display_message(@num_guesses)
      @num_guesses += 1
      @num_guesses == 7
    end
  end

  def end_game
    if @winner
      puts "Congratulations! #{@name}, You Won!"
    else
      puts 'Sorry, You lost!'
      puts "The word was '#{@random_word_array.join('')}'"
      p @guessed_letters
    end
    true
  end

  def ask_to_continue
    p @guessed_letters
    choice = continue_playing
    return if choice

    puts 'Game Stopped!'
    dump_data
    choice
  end

  def play_game
    game_over = false
    counter = 0
    until game_over
      counter = play_round(counter)
      game_over = game_finished(counter)
      game_over = game_over ? end_game : ask_to_continue
    end
  end
end

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
