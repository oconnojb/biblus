require 'nokogiri'
require 'open-uri'
require 'pry'

class Biblus::BibleScraper
  attr_accessor :passage_hash

   def initialize
     @passage_hash = {}
   end

   def scrape_biblegateway
     doc = Nokogiri::HTML(open("https://www.biblegateway.com/"))
     passage = Passage.new
     passage.text = doc.css(".votd-box p").text
     citation = doc.css(".votd-box a").first.text.split
     passage.book = citation[0]
     sp_array = citation[1].split(":")
     passage.chapter = sp_array[0]
     passage.verse << sp_array[1]
     passage
  end
end
