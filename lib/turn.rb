# frozen_string_literal: true

require 'pry-byebug'

# This class is responsible for managing a turn
class Turn
  attr_accessor :game, :player

  def initialize(game, player)
    @game = game
    @game.turns.push(self)
    @player = player
  end

  def one_digit?(input)
    !!(input =~ /^[1-9]$/)
  end

  def obtain_input # rubocop:disable Metrics/MethodLength
    input = ''
    loop do
      puts "\n#{player[:name]}, please enter a number from 1 to 9 to place your X or O\n\n"
      input = gets.chomp

      if !one_digit?(input)
        puts "\nInvalid input!\n\n"
      elsif game.grid[input.to_i - 1].x_or_o
        puts "\nSpace already taken!\n\n"
      else
        break
      end
    end
    input
  end

  def assign_symbol
    input = obtain_input

    game.grid[input.to_i - 1].x_or_o =
      player[:number] == 1 ? 'X' : 'O'
  end

  def decide_turn_player
    game.turn_player = game.turn_player[:number] == game.player1[:number] ? game.player2 : game.player1
  end

  def play
    assign_symbol

    decide_turn_player
  end
end
