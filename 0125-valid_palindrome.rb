# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  filtered_string = s.downcase.gsub(/[^a-z0-9]/, "")
  filtered_string == filtered_string.reverse
end