class Player

  attr_reader :lives, :num, :dead

  def initialize(name, num)
    @lives = 3
    @name = name
    @num = num
    @dead = false
  end

  def remove_life
    @lives = lives > 0 ? @lives - 1 : 0
    if @lives == 0 then @dead = true end
  end

end