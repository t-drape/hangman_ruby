# frozen_string_literal: true

require 'yaml'

require_relative('game')

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
