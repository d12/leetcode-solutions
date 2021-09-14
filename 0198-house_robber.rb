# O(N) time, O(1) space
def rob(nums, robbed_last = false)
  return 0 if nums.empty?

  runs = [
    {robbed_last: false, sum: 0},
  ]

  i = 0
  while i < nums.length
    runs = prune_runs(runs)
    new_runs = []
    runs.each do |run|
      if run[:robbed_last]
        new_runs << {robbed_last: false, sum: run[:sum]}
      else
        new_runs << {robbed_last: false, sum: run[:sum]}
        new_runs << {robbed_last: true, sum: run[:sum] + nums[i]}
      end
    end

    runs = new_runs
    i += 1
  end

  runs.map{|a| a[:sum]}.max
end

def prune_runs(runs)
  categories = runs.partition { |run| run[:robbed_last] }.reject{|a| a.empty?}
  maxes = categories.map do |category|
    category.max {|a, b| a[:sum] <=> b[:sum]}
  end
  maxes.flatten
end