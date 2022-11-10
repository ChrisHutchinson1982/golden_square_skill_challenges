def grammar_checker(text)
  if text == nil || text == ""
    fail "Invalid nil value"
  end
  
  first_letter = text[0]
  last_char = text[-1]

  first_letter == first_letter.capitalize && last_char.match(/[.?!]/) ? true : false

end