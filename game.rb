require './player'
require './round'
require './helpers'

class Game

  def initialize()
    @players = []
    @rounds = []

    # add players
    add_player 1
    add_player 2

    # select initial player randomly
    @current_player = @players[rand(1)]

    # start game
    new_round

  end

  def add_player(num)
    name = prompt("Player #{num}: What\'s your name? ")
    @players << Player.new(name, num)
  end

  def new_round
    @rounds << Round.new(@current_player)
    
    next_player = @players[@current_player.num  % 2]

    if @current_player.dead
      puts "Player #{next_player.num} wins with #{next_player.lives} lives remaining."
    else
      puts "P1: #{@players[0].lives}/3 vs. P2: #{@players[1].lives}/3"
      @current_player = next_player
      new_round
    end
  end


end