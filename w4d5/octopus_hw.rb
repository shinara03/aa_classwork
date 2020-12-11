#['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
#=> "fiiiissshhhhhh"

# Sluggish Octopus O(n^2)
def sluggish_octopus(arr)
  longest = arr[0]
  arr.each_with_index do |ele1, idx1|
    arr.each_with_index do |ele2, idx2|
      if ele2.length > ele1.length 
        longest = arr[idx2]
      end
    end
  end
  longest 
end

#Dominant Octopus O(n * log n)
def dominant_octopus(arr)
  mid = arr.length / 2
  right = arr[mid..-1]    

  
end

# clever octopus O(n)
def clever_octopus(arr) 
  longest = arr[0]
  arr.each do |ele|
    longest = ele if ele.length > longest
  end
  longest
end

#slow dance O(n)
def slow_dance(dir, arr)
  arr.each_with_index do |ele, idx|
    return idx if ele == dir
  end
end

#constant dance O(1)
def fast_dance(dir, hash)
  hash[dir]
end


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
puts slow_dance("up",tiles_array)
puts slow_dance("right-down", tiles_array)

tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}
puts fast_dance("up", tiles_hash)
puts fast_dance("right-down", tiles_hash)
