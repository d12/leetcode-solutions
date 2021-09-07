# The read4 API is already defined for you.
# Below is an example of how the read4 API can be called.
# file = File.new("abcdefghijk") File is "abcdefghijk", initially file pointer (fp) points to 'a'
# buf4 = [' '] * 4 Create buffer with enough space to store characters
# read4(buf4) # read4 returns 4. Now buf = ['a','b','c','d'], fp points to 'e'
# read4(buf4) # read4 returns 4. Now buf = ['e','f','g','h'], fp points to 'i'
# read4(buf4) # read4 returns 3. Now buf = ['i','j','k',...], fp points to end of file

# @param {List[str]} buf
# @param {int} n
# @return {int}
def read(buf, n)
  buf_pointer = 0
  buf4 = ' ' * 4
  while buf_pointer < n
    chars_read = read4(buf4)
    if chars_read == 0
      return buf_pointer
    end

    chars_to_write = [n - (buf_pointer), chars_read].min
    buf[buf_pointer..buf_pointer + chars_to_write] = buf4[0..chars_to_write].chars
    buf_pointer += chars_to_write
  end

  return buf_pointer
end