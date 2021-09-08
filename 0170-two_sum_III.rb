class TwoSum
  def initialize()
    @hash = {}
  end

  def add(number)
    @hash[number] ||= 0
    @hash[number] += 1 # Store count in case we need to remove in a future problem
  end

  def find(target)
    @hash.keys.each do |val|
      difference = target - val
      if difference == val
        return true if @hash[difference] > 1
      else
        return true if @hash[difference]
      end
    end

    false
  end
end