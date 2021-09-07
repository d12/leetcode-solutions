def two_sum(nums, target)
      hash = {}
      nums.each_with_index do |num, index|
          required_num = target - num
          if(hash[required_num])
              return hash[required_num], index
          end

          hash[num] = index
      end
  end