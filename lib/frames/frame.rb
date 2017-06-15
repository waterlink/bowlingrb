RawFrame = Struct.new(:first, :second, :third)

class Frame < RawFrame
  def valid?
    true
  end

  def bonus_rolls
    BonusRolls.new(0, 0)
  end

  def score
    first + second
  end

  def score_with_bonus
    score + bonus_rolls.score
  end

  def frame_size
    2
  end
end