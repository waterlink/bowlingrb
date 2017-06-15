class StrikeFrame < Frame
  def valid?
    first == 10
  end

  def bonus_rolls
    BonusRolls.new(second, third)
  end

  def score
    first
  end

  def frame_size
    1
  end
end