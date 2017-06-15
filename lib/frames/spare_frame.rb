class SpareFrame < Frame
  def valid?
    first + second == 10
  end

  def bonus_rolls
    BonusRolls.new(third, 0)
  end
end