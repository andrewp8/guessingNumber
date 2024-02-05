class LuckyNumber
  attr_reader :attempts
  attr_reader :guess_range
  attr_reader :max_attempts
  attr_reader :lucky_number

  def initialize(guess_range, max_attempts)
    @max_attempts = max_attempts
    @guess_range = guess_range
    @lucky_number = rand(1..@guess_range)
    @attempts = Array.new

  end 

  def unique_number?(num)
    @attempts.index(num).nil?
  end

  def within_range?(num)
    num >= 1 and num <= @guess_range
  end

  def lower_guess?(num)
    num < lucky_number
  end

  def higher_guess?(num)
    num > lucky_number
  end

  def valid_guess(num)
    @attempts << num
    @attempts.sort!
  end

  def won?(num)
    num == @lucky_number
  end

  def reached_max_attempts?
    @attempts.size == @max_attempts
  end

  def show
    puts guesses
  end
  
  def reset
    @attemps = []
    @lucky_number = rand(1..@guess_range)
  end

  def guesses # custom getter
    "Guesses: #{@attempts*','}"
  end
  
end
