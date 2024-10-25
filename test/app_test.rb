# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/app'

# Test app
class AppTest < Minitest::Test
  def test_coolness_off_the_charts
    # skip
    assert_equal 'Hello world!', App.new.message
  end
end
