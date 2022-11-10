class GrammarStats
  def initialize
    @scores_array = []
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    
    first_letter = text[0]
    last_char = text[-1]

    output = (first_letter == first_letter.capitalize && last_char.match(/[.?!]/) ? true : false)
    @scores_array << output
    return output

  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
    pass_scores = (@scores_array.count(true).to_f/@scores_array.count) * 100
    pass_scores.round
  end
end