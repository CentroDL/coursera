require 'minitest/autorun'
require_relative 'tree_height'

class TreeHeightTest < Minitest::Test
  def test_regular_array
    assert_equal 3, TreeHeight.new("5\n4 -1 4 1 1\n").compute_height
  end

  def test_2
    assert_equal 4, TreeHeight.new("5\n-1 0 4 0 3\n").compute_height
  end

  def test_3
    assert_equal 4, TreeHeight.new("10\n9 7 5 5 2 9 9 9 2 -1\n").compute_height
  end

  def test_3
    assert_equal 6, TreeHeight.new("10\n8 8 5 6 7 3 1 6 -1 5\n").compute_height
  end
end
