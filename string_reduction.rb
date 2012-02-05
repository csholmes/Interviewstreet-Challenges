#!/usr/bin/ruby

# Curtis Holmes
# Interview Street String Reduction Problem

# The pattern:
# If the string is all a's, all b's, or all c's, then return the length of the string, you can't reduce anything
# Otherwise, you have to find the number of a's, b's, and c's.
# If the number of a's, b's, and c's are all odd or all even, then return 2
# Otherwise return 1
#
# The reason for this:
# For any triplet with all 3 a's/b's/c's => return 3
# For any triplet with [0,1,2] abc-frequency, such as aab, can be reduced to 1 (aab -> ac -> b)
# For any triplet with [1,1,1] abc-frequency, return 2. Example. abc. You can only reduce this to cc or aa. 
#
# For a 4-tuple with [0,2,2] abc-frequency, you have to reduce it to [1,1,1], so you have to return 2.
# For a 5-tuple [1,1,3], you have options to reduce it .. [2,0,2],[0,2,2],[0,0,4] - best option gives 2
#
# Basically, if you have all even, any reduction will give you all odd, 
# and if you have all odd, any reduction will give you all even. 
# So you can't get out of the trap
#
# And anything else can reduce to one letter

def string_reduce(str)
  
  # Count the number of a's, b's, and c's in the string
  a,b,c = 0,0,0
  str.length.times do |i|
    case str[i,1]
    when "a"; a += 1
    when "b"; b += 1
    when "c"; c += 1
    end
  end
  
  # if two of the a,b,c are 0, return the string length. 
  # otherwise, check if the evenness of a, b, and c are all the same
  (a+b==0 or b+c==0 or a+c==0) ? (return str.length) : ((a%2==b%2 and b%2==c%2) ? (return 2) : (return 1))
  
end

tests = gets.chomp  # get the number of tests

tests.to_i.times do 
  puts string_reduce(gets.chomp) 
end