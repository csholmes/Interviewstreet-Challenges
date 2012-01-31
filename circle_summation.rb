#!/usr/bin/ruby

# Curtis Holmes
# Interview Street Circle Summation

n = 5
m = 1
values = [10,20,30,40,50]
n_values = [values]*n

m.times do |i|
  n_size = n_values.size 
  n_size.times do |n|
    puts n
    s = n_values[n].size
    puts n_values[n][i]
    puts n_values[n][((i-1) % s)] + n_values[n][((i+1) % s)]
    n_values[n][i] += n_values[n][((i-1) % s)] + n_values[n][((i+1) % s)]
  end
end

puts "******"
puts n_values


# This gets the input and returns an output

#tests = gets.chomp

#tests.to_i.times do
#  line = gets.chomp
#  puts sim(line, line) 
#end
