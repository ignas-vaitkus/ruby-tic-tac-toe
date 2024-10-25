# frozen_string_literal: true

require 'minitest/autorun'
require 'stringio'
require_relative '../lib/game'

# Test app
class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_empty_board_print
    assert_equal '1 | 2 | 3
__________
4 | 5 | 6
__________
7 | 8 | 9', @game.to_s
  end

  def test_game_start
    $stdin = StringIO.new("Player 1\nPlayer 2\n")
    @game.game_start

    assert_equal 'Player 1', @game.player1[:name]
    assert_equal 'Player 2', @game.player2[:name]
  end
end
