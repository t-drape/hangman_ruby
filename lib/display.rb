# frozen_string_literal: true

# String characters for Hangman Display between turns
module Display
  def message_zero
    4.times do
      puts '      |'
      sleep 0.5
    end
  end

  def message_one
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
  end

  def first_line
    print ' 0'
    sleep 0.5
    5.times do
      print '-'
      sleep 0.5
    end
    puts '|'
    sleep 0.5
  end

  def full_second_line
    sleep 0.5
    print '-'
    sleep 0.5
    print '|'
    sleep 0.5
    print '-'
    sleep 0.5
    puts '    |'
    sleep 0.5
  end

  def full_third_and_end
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

  def message_two
    first_line
    3.times do
      puts '       |'
      sleep 0.5
    end
  end

  def message_three
    first_line
    puts ' |     |'
    sleep 0.5
    2.times do
      puts '       |'
      sleep 0.5
    end
  end

  def body
    print '-'
    sleep 0.5
    print '|'
    sleep 0.5
    print '-'
    sleep 0.5
  end

  def message_four
    first_line
    body
    puts '    |'
    sleep 0.5
    puts '       |'
    sleep 0.5
    puts '       |'
  end

  def message_five
    first_line
    body
    puts '    |'
    sleep 0.5
    print ' +'
    sleep 0.5
    puts '     |'
    sleep 0.5
    puts '       |'
  end

  def message_six
    first_line
    full_second_line
    full_third_and_end
  end

  def display_message(number)
    case number
    when 0
      message_zero
    when 1
      message_one
    when 2
      message_two
    when 3
      message_three
    when 4
      message_four
    when 5
      message_five
    else
      message_six
    end
  end
end
