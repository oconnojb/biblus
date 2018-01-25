require 'nokogiri'
require 'open-uri'
require 'pry'

class Biblus::BibleScraper
   def scrape_biblegateway
     doc = Nokogiri::HTML(open("https://www.biblegateway.com/"))
     passage = Passage.new
     passage.text = doc.css(".votd-box p").text
     citation = doc.css(".votd-box a").first.text.split
     passage.book = citation[0]
     sp_array = citation[1].split(":")
     passage.chapter = sp_array[0]
     passage.verse << sp_array[1]
     passage.link_to_full = "https://www.biblegateway.com"+doc.css(".votd-actions-component a")[1]['href']
     binding.pry
     passage
  end
end
