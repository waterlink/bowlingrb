class FrameCreator
  def initialize(frame_kinds = [StrikeFrame, SpareFrame, Frame])
    @frame_kinds = frame_kinds
  end

  def create(rolls, index)
    first = rolls.fetch(index, 0)
    second = rolls.fetch(index + 1, 0)
    third = rolls.fetch(index + 2, 0)

    from(first, second, third)
  end

  private

  attr_reader :frame_kinds

  def from(first, second, third)
    frame_kinds
        .map {|f| f.new(first, second, third)}
        .find(&:valid?)
  end
end