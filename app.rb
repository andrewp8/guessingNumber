require_relative "lucky_number"

class App
  attr_reader :guess

  def initialize(guess_range=15, max_attempts=5)
    @guess = LuckyNumber.new(guess_range, max_attempts)
  end
  def run
    loop do
      break if @guess.reached_max_attempts?

      puts "Enter a unique number from 1 to #{@guess.guess_range}, nothing to end. #{@guess.max_attempts - @guess.attempts.size} attempts"

      input = gets.chomp

      break if input.empty?
      
      begin
        number = Integer(input)
        if @guess.won?(number)
          puts "Congratualations! You guessed the correct number!"
          break
        else
          if ! @guess.within_range?(number)
            puts "Guess not in range. (1 to #{@guess.guess_range})"
            next
          end
          if ! @guess.unique_number?(number)
            puts "Guess a number not already chosen"
            next
          end
          if @guess.lower_guess?(number)
            puts "Too low! Guess higher."
            @guess.valid_guess(number)
            @guess.show
            next
          end
          if @guess.higher_guess?(number)
            puts "Too high! Guess lower."
            @guess.valid_guess(number)
            @guess.show
            next
          end
          
        end
      rescue ArgumentError
        puts "Invalid input. Please enter a valid number."
      end #begin
    end #loop
    if @guess.reached_max_attempts?
      puts "Sorry, you have reached the maximum number of attempts. The correct number is #{@guess.lucky_number}"
    end
  end #run
end #class App

lets_go = App.new
lets_go.run
