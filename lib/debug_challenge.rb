# debugged this exmaple it using Discovery Debugging 
# it was return 0 index rather -1 and also including spaces in the count

def get_most_common_letter(text)
  p "at start of method text is #{text}"
  counter = Hash.new(0)
  p "before loop counter is #{counter}"
  text.split(" ").join.chars.each do |char|
    p "at start of loop char is #{char}"
    counter[char] += 1
    p "at end of loop counter is #{counter}"
  end
    p "after loop counter is #{counter}"
    p "changed counter to array #{counter.to_a}"
    p "counter array sorted by value #{counter.to_a.sort_by { |k, v| v }}"
  counter.to_a.sort_by { |k, v| v }[-1][0]
end

puts get_most_common_letter("the roof, the roof, the roof is on fire!")

# Intended output:
# 
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"
