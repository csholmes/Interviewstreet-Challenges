#!/usr/bin/ruby

# Curtis Holmes
# Interview Street String Similarity

# This is a recursive function that calculates the length of the longest common prefix between two strings
# If both of the strings are not blank, and the first characters are the same, then add one to the same function with both 
# of the first characters taken off of the string (.slice(1..-1))

def l_pre(a,b)
  a == b ? (return a.length) : ((a.length > 0 and b.length > 0 and a[0] == b[0]) ? (return 1 + l_pre(a.slice(1..-1),b.slice(1..-1))) : (return 0))
end

# This is a recursive function that gives 0 is the substring is 0, 
# and otherwise adds the longest common prefix number of the string and substring, 
# and adds that to the same function with the first character taken off of the substring

def sim(str, substr)
  substr.length > 0 ? (return l_pre(str, substr) + sim(str,substr.slice(1..-1))) : (return 0)
end

# This gets the input and returns an output

tests = gets.chomp

tests.to_i.times do
  line = gets.chomp
  puts sim(line, line) 
end
