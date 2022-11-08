def make_snippet(string)
  words = string.split(' ')
  result = words[(0..4)].join(' ')
  if words.count > 5
    result += "..."
  end
  return result
end