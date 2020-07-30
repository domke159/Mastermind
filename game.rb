class Game
  attr_accessor :players
  attr_accessor :colours
  MAX_MOVES = 12

  def initialize(player1)
    @players = [player1]
    @colours = ['R', 'B', 'G', 'Y', 'P', 'O']
  end

  def move(player)
    guess_code = []
    puts "\n#{player.name} please make your guess by selecting 4 colours from the list: "\
          "write 'R' for red, 'B' for blue, 'G' for green, 'Y' for yellow, 'P' for purple, 'O' for Orange\n"
    4.times do   
      loop do
        puts 'Select your colour: ' 
        guess = gets().chomp.capitalize
        if @colours.include?(guess)
          guess_code.push(guess)
          break
        else
          puts("\nWrong selection. Try again. \n")
        end
      end
    end
    puts "Your guess is #{guess_code}"
    guess_code
  end

  def feedback(guess_code, code)
    result_c_pos = 0
    result_c = 0
    guess_code.zip(code).map { |a, b| 
      if a == b 
        result_c_pos += 1
      elsif code.include?(a)
        result_c += 1
      else
        next
      end
    }  
    puts "You have guessed the position and colour of #{result_c_pos} pins "\
         "additionally you have guessed the colour of #{result_c} pins "
  end

  def play
    has_won = false
    move = 1
    computer = Computer.new
    code = computer.create_code
    puts(code)
    until has_won || move == MAX_MOVES
      guess_code = move(@players[0])
      if guess_code == code
        has_won = true
      else
        feedback(guess_code, code)
      end
      move += 1
    end  
    has_won ?
      puts("\nYou have guessed the code. Congratulations!") :
      puts("\nYou have not managed to break the code. Better luck next time!")  
  end
end