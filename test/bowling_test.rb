require './test/test_helper'
require './lib/bowling'

class BowlingTest < Minitest::Test

  def setup
    @game = Bowling.new
  end

  def test_empty_game
    score = @game.score

    assert_equal(0, score,
                 'score worth no single pin')
  end

  def test_gutter_game
    20.times do
      @game.roll(0)
    end

    score = @game.score

    assert_equal(0, score,
                 'score worth no single pin')
  end

  def test_game_of_ones
    20.times do
      @game.roll(1)
    end

    score = @game.score

    assert_equal(20, score,
                 'sum of all pins rolled')
  end

  def test_game_with_a_spare
    @game.roll(3)
    @game.roll(7)
    @game.roll(4)
    @game.roll(5)
    16.times do
      @game.roll(0)
    end

    score = @game.score

    assert_equal((3 + 7 + 4) + (4 + 5), score,
                 'sum with bonus for next roll after spare')
  end

  def test_game_with_a_spare_at_the_end
    18.times do
      @game.roll(0)
    end
    @game.roll(3)
    @game.roll(7)
    @game.roll(4)

    score = @game.score

    assert_equal(3 + 7 + 4, score,
                 'sum with bonus for next roll after spare')
  end

  def test_game_with_a_strike
    @game.roll(10)
    @game.roll(7)
    @game.roll(2)
    18.times do
      @game.roll(0)
    end

    score = @game.score

    assert_equal((10 + 7 + 2) + (7 + 2), score,
                 'sum with bonus for next two roll after strike')
  end

  def test_perfect_game
    12.times do
      @game.roll(10)
    end

    score = @game.score

    assert_equal(300, score,
                 '10 x 30 score because of 12 strikes')
  end

end