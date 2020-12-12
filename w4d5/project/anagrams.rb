#phase 1
# n!, n!
#space complex: n! ---> generating many arrays to store the different permutations
# time complexity of .split('') is n ---> it iterates thru
#.include?: n
def first_anagram?(string_a, string_b)

  string_a.split("").permutation.to_a.include?(string_b.split(""))
end

# p first_anagram?("cat","tac")
# n^2, 
def second_anagram?(string_a, string_b)
  string_b_arr = string_b.split("")  # => n 

  string_a.each_char do |c|  # => n 
    search = string_b_arr.find_index(c) # => n

    case search
    when nil
      return false
    else
      string_b_arr.delete_at(search) # => n
    end

  end

  string_b_arr.empty? && string_a.length == string_b.length
end

# .sort in ruby uses an optimized quicksort = nlog(n) 
#split is O(n)
# mulitply n for loops
# add n for same level 


def third_anagram?(string_a, string_b)

  string_a.split("").sort == string_b.split("").sort
end

# O(n)
def fourth_anagram?(string_a, string_b)

  hash_1 = Hash.new(0)
  hash_2 = Hash.new(0)

  string_a.each_char{|c| hash_1[c]+=1 }
  string_b.each_char{|c| hash_2[c]+=1 }

  hash_1 == hash_2
end
p fourth_anagram?("cat", "tac")