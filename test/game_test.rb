# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/game'

# Test app
class GameTest < Minitest::Test
  def test_empty_board_print
    assert_equal '1 | 2 | 3
__________
4 | 5 | 6
__________
7 | 8 | 9', Game.new.to_s
  end
end
