require 'nokogiri'
require 'open-uri'
require 'pry'

class Biblus::BibleScraper
  attr_accessor :todays_passage, :todays_chapter_array

  def scrape_full_chapter(link)
    doc = Nokogiri::HTML(open(link))
    full_chapter = []
    chapter = doc.css(".passage-content p")
    chapter.each do |p|
      full_chapter << "#{p.text}"
    end
    str_ch = full_chapter.join(" ")
    @todays_chapter_array = str_ch.split(/\d+/)
    @todays_chapter_array
  end

  def scrape_todays_passage
    doc = Nokogiri::HTML(open("https://www.biblegateway.com/"))
    @todays_passage = Passage.new
    @todays_passage.text = doc.css(".votd-box p").text
    citation = doc.css(".votd-box a").first.text.split
    @todays_passage.book = citation[0]
    sp_array = citation[1].split(":")
    @todays_passage.chapter = sp_array[0]
    @todays_passage.verse << sp_array[1]
    @todays_passage.link_to_full = "https://www.biblegateway.com"+doc.css(".votd-actions-component a")[1]['href']

    @todays_passage
  end
end
