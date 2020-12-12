def bad_two_sum?(arr, target_sum)

  bad_arr = []

  arr.each_with_index do |ei, i|
    arr.each_with_index do |ej, j|
 
      return true if j > i && ei + ej == target_sum 
    end
  end

  false 
end

def okay_two_sum?(arr, target_sum)

  sorted = arr.sort
  


end


# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false