class MasterMind
  COLORS = ['R', 'B', 'G', 'Y']
  def initialize
    @secret_code = COLORS.sample(4)
  end
  
  def start_game
    puts "Welcome to MasterMind!"
    
    loop do
      print "\nEnter your guess (e.g., 'RBGY'): "
      guess = gets.chomp.upcase
      
      if guess == 'QUIT'
        break
      elsif guess.length != 4 || guess.split('').any? { |color| not COLORS.include?(color) }
        puts "Invalid guess, please enter a 4-letter code using the colors R, B, G, Y"
      else
        puts take_turn(guess)
      end
    end
  end
  
  def take_turn(guess)
    exact_matches = 0
    partial_matches = 0
    
    @secret_code.each_with_index do |color, index|
      if color == guess[index]
        exact_matches += 1
      elsif guess.include?(color)
        partial_matches += 1
      end
    end
    
    "#{exact_matches} exact matches and #{partial_matches} partial matches"
  end

  MasterMind.new.start_game
end