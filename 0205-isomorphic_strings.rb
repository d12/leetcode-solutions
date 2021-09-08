# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  structure_map_from_string(s) == structure_map_from_string(t)
end

def structure_map_from_string(s)
  seen_chars = {}
  map = []
  next_value = 0

  s.chars.each do |char|
    if seen_chars[char]
      map << seen_chars[char]
    else
      seen_chars[char] = next_value
      next_value += 1
    end
  end

  map
end