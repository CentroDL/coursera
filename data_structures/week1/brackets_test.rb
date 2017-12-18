require 'minitest/autorun'
require_relative 'brackets'

class BracketTest < Minitest::Test
  def test_regular_array
    assert_equal 'Success', Bracket.balanced('[]')
  end

  def test_2
    assert_equal 'Success', Bracket.balanced('{}[]')
  end

  def test_3
    assert_equal 'Success', Bracket.balanced('[()]')
  end

  def test_4
    assert_equal 'Success', Bracket.balanced('(())')
  end

  def test_5
    assert_equal 'Success', Bracket.balanced('{[]}()')
  end

  def test_6
    assert_equal 1, Bracket.balanced('{')
  end

  def test_15
    assert_equal 1, Bracket.balanced('}')
  end

  def test_7
    assert_equal 3, Bracket.balanced('{[}')
  end

  def test_8
    assert_equal 'Success', Bracket.balanced('foo(bar);')
  end

  def test_26
    assert_equal 3, Bracket.balanced('[](()')
  end

  def test_9
    assert_equal 10, Bracket.balanced('foo(bar[i);')
  end
end
