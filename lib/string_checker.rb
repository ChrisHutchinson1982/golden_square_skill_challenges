def string_checker(string)

  fail "Invalid nil entry" unless string != nil

  string.include?("#TODO")

end