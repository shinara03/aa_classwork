require "byebug"

#linear time, constant space
def my_min(list)
  min = list.first
  list.each_with_index do |ei, i|
    min = ei if ei < min
  end
  min
end

# def compare(arr)
#   result = {}
#   arr.each_with_index do |ei, i|
#     arr.each_with_index do |ej, j|
#       if j > i 
#         result[[ei, ej]] = ei <=> ej
#       end
#     end
#   end
#   result
# end

#n^2, constant space
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
# n^3, n^2 - n => n^2
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
# p _subsum(list)


def _subsum(list)
  largest_sum = -1.0/0.0
  current_sum = 0
  

  i = 0 
  start, finish = 0 , 0
  until start == list.length 

    # debugger

    start = i
    if finish >= list.length
      finish = start 
      i += 1
    end 
    current_sum = list[start..finish].sum
    largest_sum = current_sum if largest_sum < current_sum && !list[start..finish].empty?

    finish += 1
  end


 # [1, 2, -4, 4, -3, 4]
 # largest = [1,3,3,4,4,]
 # current = [1,3,-1,4,1,5]

 # 

  largest_sum
end

def subsum2(list)
  largest = list.first
  current = list.first

  (1..list.length-1).each do |i|
    if current < 0
      current = list[i]
    else
      current += list[i]
    end
    
    if current > largest 
      largest = current 
    end
  end

  largest
end

list = [5, 3, -7]
# [5]
# [5]
p subsum2(list)
list = [2, 3, -6, 7, -6, 7]
p subsum2(list)
list = [-5, -1, -3]
p subsum2(list)
