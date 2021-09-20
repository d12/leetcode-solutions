# Process strings into signatures
# Group strings into hash by signature (signature is a hash in this case)
# Build anagram list by hash
# Time: O(N) (Iterate over each char of each string one time, hash operations are O(1))
# Storage: sig_hash is at least O(N). We also create a key hash for every string which is O(N).
# So, storage is O(N)

def group_anagrams(strs)
  sig_hash = Hash.new([])
  strs.each do |str|
    key = Hash.new(0)
    str.chars.each do |c|
      key[c] += 1
    end

    sig_hash[key] += [str]
  end

  sig_hash.values
end