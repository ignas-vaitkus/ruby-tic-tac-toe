# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/space'

class SpaceTest < Minitest::Test
  def setup
    @space = Space.new(1)
  end

  def test_initialization
    assert_nil @space.x_or_o
    assert_equal 1, @space.number
  end

  def test_to_s_returns_number_when_x_or_o_is_nil
    assert_equal '1', @space.to_s
  end

  def test_to_s_returns_x_or_o_when_not_nil
    @space.x_or_o = 'X'

    assert_equal 'X', @space.to_s
  end
end
