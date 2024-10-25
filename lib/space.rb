# frozen_string_literal: true

# The space for tic or tac on the board
class Space
  attr_accessor :x_or_o, :number

  def initialize(number)
    @x_or_o = nil
    @number = number
  end

  def to_s
    x_or_o || number.to_s
  end
end
