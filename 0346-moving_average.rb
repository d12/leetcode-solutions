#O(1) time, O(size) space

class MovingAverage
  def initialize(size)
    @size = size
    @window = []
    @sum = 0.0
  end

  def next(val)
    @sum += val
    @window.push val
    @sum -= @window.shift if @window.length > @size

    @sum / @window.length
  end
end