require_relative 'bonus_rolls'
require_relative 'frames'
require_relative 'frame_creator'

class Bowling
  def initialize(frame_creator = FrameCreator.new)
    @frame_creator = frame_creator
    @rolls = Array.new(0) {0}
  end

  def score
    total = 0
    index = 0

    10.times do
      frame = frame_creator.create(rolls, index)
      total += frame.score_with_bonus
      index += frame.frame_size
    end

    total
  end

  def roll(pins)
    rolls << pins
  end

  private

  attr_reader :frame_creator, :rolls
end
