#!/usr/bin/ruby

# Curtis Holmes
# Interview Street String Similarity

# This function has two counters, left and right, and a value
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
