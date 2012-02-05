#!/usr/bin/ruby

# Interview Street
# String Reduction Problem

# This is my first attempt. I use dynamic programming/memoization

# It won't work because it's not fast enough. works up to length ~20

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

#q = "ccbbacbbcaabccaabbbccbcbb"
#p q
#p reduce(q)
#p @h.size
