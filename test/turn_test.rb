# frozen_string_literal: true

require 'minitest/autorun'
require 'stringio'
require_relative '../lib/turn'
require_relative '../lib/game'

class TurnTest < Minitest::Test
  def setup
    @turn = Turn.new(Game.new, { name: 'Player 1', number: 1 })
  end

  def test_one_digit?
    assert @turn.one_digit?('1')
    refute @turn.one_digit?('10')
    refute @turn.one_digit?('a')
  end

  def test_obtain_input
    number = rand(1..9)
    $stdin = StringIO.new("#{number}\n")

    assert_equal number.to_s, @turn.obtain_input
  end

  def test_play
    number = rand(1..9)
    $stdin = StringIO.new("#{number}\n")
    @turn.play

    assert_equal 'X', @turn.game.grid[number - 1].x_or_o
    assert_equal 2, @turn.game.turn_player[:number]
  end
end
