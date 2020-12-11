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

# p second_anagram?("cat", "tac")

# n^2 or nlog(n) 
def third_anagram?(string_a, string_b)

  string_a.split("").sort == string_b.split("").sort


end

p third_anagram?("tacc", "tac")