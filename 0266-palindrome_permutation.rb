# O(N) time, O(N) space
def can_permute_palindrome(s)
  letter_count = {}
  s.chars.each do |c|
    letter_count[c] ||= 0
    letter_count[c] += 1
  end

  if s.length % 2 == 0
    letter_count.values.all? { |count| count % 2 == 0 }
  else
    found_one_uneven = false
    letter_count.values.each do |count|
      if count % 2 == 0
        next
      end

      if found_one_uneven
        return false
      end

      found_one_uneven = true
    end

    true
  end
end