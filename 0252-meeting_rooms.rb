#O(n^2) solution, times out
def can_attend_meetings(intervals)
  intervals.each_with_index do |(start_time, end_time), index|
     intervals[(index + 1)..-1].each do |(inner_start_time, inner_end_time)|
       return false if (start_time == inner_start_time) || (end_time == inner_end_time) || (start_time > inner_start_time && start_time < inner_end_time) || (inner_start_time > start_time && inner_start_time < end_time)
     end
  end

 true
end

# O(nlogn) solution
def can_attend_meetings(intervals)
 sorted_intervals = intervals.sort_by {|a| a[0]}
 sorted_intervals.each_with_index do |(_start_time, end_time), index|
   return false if sorted_intervals[index + 1] && (end_time > sorted_intervals[index + 1][0])
 end

 true
end