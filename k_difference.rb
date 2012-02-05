#!/usr/bin/ruby

# Curtis Holmes
# Interview Street K Difference

# This completed successfully on the first time!

# For this problem, my algorithm first sorts the values from highest to lowest.
# Then, I have two counters i and j, and I move them right throughout the array
# to look for matches. On a match, the counter is increased, and i and j are
# incremented. Otherwise, either i or j is moved right accordingly.

def k_diff (array,diff)
  
  array.sort!.reverse! #sort and reverse the array
  
  count,i,j = 0,0,1
  
  while j < array.size
    if array[i] < (array[j]+diff) #go to the next one
      j += 1
    elsif array [i] == (array[j]+diff)
      count += 1; i += 1; j += 1
    else
      i += 1
    end
  end
  return count
end

# This gets each input and puts it into the K Difference function

n_k = gets.chomp
values = gets.chomp
puts k_diff(values.split(" ").map { |s| s.to_i }, n_k.split(" ")[1].to_i)

