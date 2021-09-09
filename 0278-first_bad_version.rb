# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
  lower = 0
  upper = n
  while lower != upper
    index_to_check = ((upper - lower) / 2) + lower
    if is_bad_version(index_to_check)
      upper = index_to_check
    else
      lower = index_to_check + 1
    end
  end

  upper
end