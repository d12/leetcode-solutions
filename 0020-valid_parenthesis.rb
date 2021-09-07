# @param {String} s
# @return {Boolean}
def is_valid(s)
  parenthesis = {
      "{" => "}",
      "(" => ")",
      "[" => "]",
  }

  stack = []
  s.chars.each do |char|
      if(parenthesis.keys.include?(char))
          stack.push char
      else
          if stack.length == 0
              return false
          end

          if parenthesis[stack.last] == char
              stack.pop
          else
              return false
          end
      end
  end

  return stack.empty?
end