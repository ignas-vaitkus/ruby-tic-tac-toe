# frozen_string_literal: true

require_relative 'space'
require_relative 'turn'

# The board of the game
class Game
  attr_accessor :grid, :turns, :player1, :player2, :turn_player, :game_ended

  WINNING_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
    [0, 4, 8], [2, 4, 6] # diagonals
  ].freeze

  def initialize
    @grid = Array.new(9).map.with_index(1) { |_, i| Space.new(i) }
    @player1 = { name: nil, number: 1 }
    @player2 = { name: nil, number: 2 }
    @turn_player = player1
    @turns = []
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

  def print_winner(player)
    puts "\n#{player[:name]} wins!\n\n"
  end

  def check_for_x_or_o(x_or_o)
    proc { |i| grid[i].x_or_o == x_or_o }
  end

  def check_winner
    WINNING_COMBINATIONS.each do |combination|
      if combination.all? check_for_x_or_o('X')
        self.game_ended = true
        print_winner player1
      elsif combination.all? check_for_x_or_o('O')
        self.game_ended = true
        print_winner player2
      end
    end
  end

  def check_draw
    return unless turns.length == 9

    self.game_ended = true
    puts "\nIt's a draw!\n\n"
  end

  def check_endings
    check_winner

    check_draw
  end

  def play
    game_start

    until game_ended
      Turn.new(self, @turn_player).play

      print

      check_endings
    end

    puts 'Game over!'
  end
end
