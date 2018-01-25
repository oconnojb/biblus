class Passage
  attr_accessor :book, :chapter, :verse, :text
                #chapter is a number
                #verse is an array of numbers

  def initialize
    @verse = []
  end
end
