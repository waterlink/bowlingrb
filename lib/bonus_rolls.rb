RawBonusRolls = Struct.new(:first, :second)

class BonusRolls < RawBonusRolls
  def score
    first + second
  end
end