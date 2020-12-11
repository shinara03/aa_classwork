
def my_min(list)
  min = list.first
  list.each_with_index do |ei, i|
    min = ei if ei < min
  end
  min
end

def compare(arr)
  result = {}
  arr.each_with_index do |ei, i|
    arr.each_with_index do |ej, j|
      if j > i 
        result[[ei, ej]] = ei <=> ej
      end
    end
  end
  result
end

def my_min_2(list)

  min = 1.0/0.0
  list.each_with_index do |ei, i|
    list.each_with_index do |ej, j|
      if ej < min && j > i
        min = ej
      end
    end
  end
  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_2(list)  # =>  -5

#largest_contiguous_subsum
def subsum(list)
  
  sublist = []

  list.each_with_index do |ei, start|
    list.each_with_index do |ej, finish|
      sub = list[start..finish]
      sublist << sub unless sub.empty?
    end
  end

  largest = -1.0/0.0
  sublist.each do |sub|
    largest = sub.sum if largest < sub.sum
  end
  largest

end

# list = [5, 3, -7]
# p subsum(list)
# list = [2, 3, -6, 7, -6, 7]
# p subsum(list)
# list = [-5, -1, -3]
# p subsum(list)


def _subsum(list)
  largest_sum = -1.0/0.0
  current_sum = 0
   finish=1
  list.each do |ei, i|
    _sub = list[i..finish].sum
    current_sum+=
  end 

  largest_sum
end