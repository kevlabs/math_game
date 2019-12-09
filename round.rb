require './helpers'

class Round

  attr_reader :num1, :num2, :answer, :success

  def initialize(player)
    @player = player
    @success = false
    run
  end
  
  def run
    ask
    validate
    if !@success then @player.remove_life end
  end

  def ask
    @num1 = Round.generate_num
    @num2 = Round.generate_num
    @answer = prompt("---- NEW TURN ----\nPlayer #{@player.num}: What does #{@num1} plus #{@num2} equal?")
  end

  def validate
    @success = @answer.to_i == @num1 + @num2
    puts @success ? "YES! You are correct!" : "Seriously? No!"
  end

  def self.generate_num
    rand(19) + 1
  end

end