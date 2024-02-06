require 'minitest/autorun'
require '../guessing_number'

class TestGuessingNumber < Minitest::Test
  def test_within_range
    guessing = GuessingNumber.new(10,3)
    assert_equal true, guessing.within_range?(9), "Within_range method failed"
  end
end
