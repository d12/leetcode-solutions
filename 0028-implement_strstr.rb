# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  if needle == ""
      return 0
  end

  haystack.chars.each_with_index do |char, index|
      if(char == needle[0])
          puts index
          puts needle.length
          if(haystack[index..(index + needle.length - 1)] == needle)
              return index
          end
      end
  end

  -1
end