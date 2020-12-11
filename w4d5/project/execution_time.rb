
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

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min_2(list)  # =>  -5

