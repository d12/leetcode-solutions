# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
  magazine_chars = Hash.new(0)
  magazine.chars.each do |c|
    magazine_chars[c] += 1
  end

  ransom_note.chars.each do |c|
    if magazine_chars[c] == 0
      return false
    end

    magazine_chars[c] -= 1
  end

  return true
end