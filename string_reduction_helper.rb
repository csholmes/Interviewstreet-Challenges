#!/usr/bin/ruby

# This is a helper file that I used to help me see the pattern that this problem generates.

@h = { "ab" => 1, "ac" => 1, "ba" => 1, "bc" => 1, "ca" => 1, "cb" => 1 }
@vh = { "ab" => "c", "ac" => "b", "ba" => "c", "bc" => "a", "ca" => "b", "cb" => "a" }

# This function calculates the different substring. Ex, "babc" => ["cbc","bcc","baa"]
def versions(str)
  v = []
  (str.length-1).times do |j|
    if str[j] != str[j+1]
      v.push str[0...j]+@vh[str[j..j+1]]+str[j+2..-1]
    end
  end
  return v
end

# if in the hash, return that value
# else, take minimum of versions
# if versions is null, return string length
def reduce(str)  
  if not @h[str].nil?
    return @h[str]
  else
    reductions = []
    versions(str).each do |v|
      val = reduce(v)
      reductions.push val
      if val == 1 # this quickens the speed
        break
      end
    end
    reductions.empty? ? (@h[str] = str.length; return str.length) : (@h[str] = reductions.min; return reductions.min)   
  end
end
  
## Before this was my first attempt at the problem. I use it to find the underlying pattern
##  
  
# This converts 0,1,2 to "a","b","c"
def a_b_c(x)
  if x == 0
    return "a"
  elsif x == 1
    return "b"
  else
    return "c"
  end
end

# this returns the frequency of a character in a string
def freq(char, string)
  return (0 .. string.length - 1).find_all { |i| string[i,1] == char }.length
end

# this only really works with number < 12 ... anything longer takes a long time
def find_pattern(number)
  
  h = {}
  
  # Create all possible abc strings of length number and put it into variable a
  (3**number).times do |i|
  
    a = ""
    value = i
    number.times do |j|
      a += a_b_c(value%3)
      value = value/3
    end
    
    # this finds the frequency of a's, b's, and c's
    arr = [freq("a",a), freq("b",a), freq("c",a)].sort
  
    if h[arr].nil?
      h[arr] = reduce(a)
    else
      if h[arr] != reduce(a)
        puts "mismatch" # let us know if there is a mismatch
      end
    end
  end

  # This displays the array 
  h.sort.each do |k,v|
    puts "["+k[0].to_s+", "+k[1].to_s+", "+k[2].to_s+"] => " + v.to_s
  end
end

find_pattern(4)
