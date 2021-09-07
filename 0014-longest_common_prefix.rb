# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  common_prefix = nil
  strs.each do |string|
      if common_prefix == nil
          common_prefix = string
          next
      end

      if string[0..(common_prefix.length - 1)] == common_prefix
          next
      end

      inner_common_prefix = common_prefix_between_two_strings(common_prefix, string)
      if inner_common_prefix == ""
          return ""
      end

      common_prefix = inner_common_prefix
  end

  common_prefix
end

def common_prefix_between_two_strings(a, b)
  common_prefix = ""
  a.length.times do |i|
      if a[i] == b[i]
          common_prefix << a[i]
      else
         return common_prefix
      end
  end

  common_prefix
end