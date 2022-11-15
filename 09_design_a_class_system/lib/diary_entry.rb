class DiaryEntry
  
  def initialize(title, contents) # title and contents are both strings
    @title = title
    @contents = contents
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split(" ").length
  end

end