require 'nokogiri'
require 'open-uri'

class Biblus::BibleScraper
  attr_accessor :passage_hash

   def initialize
     @passage_hash = {}
   end

   def scrape_biblegateway
     Nokogiri::HTML(open("https://www.biblegateway.com/"))
    #responsible for scraping information from biblegateway and creating a new passage

    # def get_page
    #   Nokogiri::HTML(open("https://www.biblegateway.com/"))
    # end
    # passage = Passage.new
    # passage.book =
    # passage.chapter =
    # passage.verse <<
  end
end
