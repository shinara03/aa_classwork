#phase 1


# n!, n!
def first_anagram?(string_a, string_b)

  string_a.split("").permutation.to_a.include?(string_b.split(""))


end

# p first_anagram?("cat","tac")


def second_anagram?(string_a, string_b)
  string_b_arr = string_b.split("")

  string_a.each_char do |c|

    string_b_arr.delete_at(string_b_arr.find_index(c)) if string_b_arr.include?(c)


  end


  string_b_arr.empty? && string_a.length == string_b.length
end

p second_anagram?("tacc", "tac")