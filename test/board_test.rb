# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/board'

# Test app
class BoardTest < Minitest::Test
  def test_empty_board_print
    assert_equal '1 | 2 | 3
__________
4 | 5 | 6
__________
7 | 8 | 9', Board.new.to_s
  end
end
