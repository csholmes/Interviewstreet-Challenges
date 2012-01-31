#!/usr/bin/ruby

# Curtis Holmes
# Interview Street Circle Summation

# This function outputs the circle summation
def circle_summation(n,m,vals)

  n_vals = []

  # Create an array
  n.times do
	  n_vals.push vals.clone
  end

  # Loop through each function
  m.times do |j|
	  n.times do |i|
		  n_vals[i][((i+j)% n)] += n_vals[i][((i+j-1)% n)] + n_vals[i][((i+j+1)% n)]
	  end
  end

  #print out each value
  n_vals.each { |val| val.each { |n| print (n%1000000007).to_s + " " }; print "\n" }
  print "\n" 
end

# This gets the number of test cases
tests = gets.chomp

# This gets each input and puts it into the circle summation function
tests.to_i.times do
  n_m = gets.chomp
  values = gets.chomp
  circle_summation(n_m.split(" ")[0].to_i, n_m.split(" ")[1].to_i, values.split(" ").map { |s| s.to_i }) 
end
