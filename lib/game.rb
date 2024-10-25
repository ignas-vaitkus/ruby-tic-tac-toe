# frozen_string_literal: true

require_relative 'space'
require_relative 'turn'

# The board of the game
class Game
  attr_accessor :grid, :turn, :player1, :player2, :turn_player, :game_ended

  def initialize
    @grid = Array.new(9).map.with_index(1) { |_, i| Space.new(i) }
    @player1 = { name: nil, number: 1 }
    @player2 = { name: nil, number: 2 }
    @turn_player = player1
  end

  def to_s
    "#{grid[0..2].join(' | ')}
__________
#{grid[3..5].join(' | ')}
__________
#{grid[6..8].join(' | ')}"
  end

  def print
    puts self
  end

  def player_input(player)
    puts "\nPlease enter a name for Player #{player[:number]}\n"
    player[:name] = gets.chomp
  end

  def game_start
    puts "\nWelcome to Tic Tac Toe\n\n"
    player_input(player1)
    player_input(player2)
    puts "\n#{player1[:name]} will be X and #{player2[:name]} will be O\n\n"
    puts "#{player1[:name]} goes first\n\n"
    self.print
  end

  def play
    game_start
    # Turn.new(self, @turn_player).start
    # grid[input.to_i - 1].x_or_o = 'X'
  end
end
