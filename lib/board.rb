# frozen_string_literal: true

require_relative 'space'

# The board of the game
class Board
  attr_accessor :grid, :turn

  def initialize
    @grid = Array.new(9).map.with_index(1) { |_, i| Space.new(i) }
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
end
