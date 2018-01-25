class Passage
  attr_accessor :book, :chapter, :verse, :text, :link_to_full
                #chapter is a number
                #verse is an array of numbers

  def initialize
    @verse = []
  end
end
