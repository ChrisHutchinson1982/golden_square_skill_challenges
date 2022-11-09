def count_words(string)
  delimiters = [" ","-"]
  number_of_words = string.split(Regexp.union(delimiters)).count
end