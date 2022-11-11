def reading_time(text)

  if text == nil
    fail "Invalid nil entry"
  else
    words_per_min = text.split(" ").count.to_f / 200
    words_per_min.round
  end

end

