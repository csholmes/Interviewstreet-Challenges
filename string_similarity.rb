#!/usr/bin/ruby

# Curtis Holmes
# Interview Street String Similarity

# This function has two counters, left and right, and a value
# The right and left compare, and if they are the same, they both move right. When the pattern is broken,
# the left goes back to 0 and the right goes to the next from where it started. Each match, and value increases.
# Also, if right is at the end of the string, the pattern is maxed out and it goes back to where it was + 1
def sim(str)
    left = 0; right = 1; value = str.length
    
    while (right < str.length or left != 0)
      (str[right] == str[left]) ? (value += 1; left += 1; right += 1) : (right += (1-left); left = 0)
      if right == str.length : (right += (1-left); left = 0) end
    end
    
    return value
end

tests = gets.chomp  # get the number of tests

tests.to_i.times do 
  puts sim(gets.chomp) 
end
