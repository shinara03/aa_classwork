#phase 1


# n!, n!
def first_anagram?(string_a, string_b)

  string_a.split("").permutation.to_a.include?(string_b.split(""))


end

# p first_anagram?("cat","tac")

# n^3, 
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



# n^2 or nlog(n) 
def third_anagram?(string_a, string_b)

  string_a.split("").sort == string_b.split("").sort
end


def fourth_anagram?(string_a, string_b)

  hash_1 = Hash.new(0)
  hash_2 = Hash.new(0)

  string_a.each_char{|c| hash_1[c]+=1 }
  string_b.each_char{|c| hash_2[c]+=1 }

  hash_1 == hash_2
end
p fourth_anagram?("cat", "tac")