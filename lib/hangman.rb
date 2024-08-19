def get_random_word(lines)
  acceptable_lines = lines.select { |line| line.length > 4 && line.length < 12 }
  acceptable_lines.sample
end

def play_game
  lines = File.readlines('google-10000-english.txt')
  random_word = get_random_word(lines)
  puts random_word
end

play_game