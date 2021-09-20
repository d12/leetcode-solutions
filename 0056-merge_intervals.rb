# N log N to sort all the intervals
# then one N iteration to merge
# Time: O(N log N)
# Space: Store sorted and merged intervals, O(N)
def merge(intervals)
  sorted_intervals = intervals.sort_by {|a| a[0]}

  merged_intervals = [sorted_intervals[0]]
  sorted_intervals[1..-1].each do |(start_time, end_time)|
    if start_time <= merged_intervals.last[1]
      merged_intervals[-1] = [merged_intervals[-1][0], [end_time, merged_intervals[-1][1]].max]
    else
      merged_intervals << [start_time, end_time]
    end
  end

  merged_intervals
end