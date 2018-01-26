require 'pry'

class Biblus::CLI
  attr_accessor :todays_passage

  def initialize
    @todays_passage = Biblus::BibleScraper.new.scrape_todays_passage
  end

  def call
    welcome
    sleep(1)
    menu
    input_manager
  end

  def welcome
    puts "Welcome to the Bible!"
    puts "Today we have a great passage from #{@todays_passage.book} for you!"
    puts "I can also look up any bible verse for you!"
  end

  def menu
    puts "***"
    puts "To see today's passage, type 'today'"
    puts "To get started looking up a verse, type 'lookup' (note: not functional yet)"
    puts "And, you can always type 'menu' or 'exit'"
    puts "***"
  end

  def display_todays_passage
    puts "***"
    puts "#{@todays_passage.text}"
    puts "#{@todays_passage.book} #{@todays_passage.chapter}:#{@todays_passage.verse[0]}"
    sleep(1)
    puts "*"
    puts "If you liked today's passage, you can type 'full' to read the rest of #{@todays_passage.book} #{@todays_passage.chapter}"
    puts "***"
  end

  def update_todays_passage
    puts "***"
    puts "Sorry! I didn't realize I was out of date!"
    hm = @todays_passage
    @todays_passage = Biblus::BibleScraper.new.scrape_todays_passage
    sleep(1)
    if hm.text == @todays_passage.text
      puts "***"
      puts "Hey! Turns out I had the correct passage all along!"
      display_todays_passage
    else
      puts "***"
      puts "Here, I should have the right passage now!"
      display_todays_passage
    end
  end

  def display_full_chapter
    full_chapter_array = Biblus::BibleScraper.new.scrape_full_chapter(@todays_passage.link_to_full)
    puts "***"
    puts "#{@todays_passage.book} #{@todays_passage.chapter}"
    puts "*"
    sleep(1)
    i=0
    full_chapter_array.each do |verse|
      if (verse != "") && (verse != ", ")
        i+=1
        puts "#{i}. #{verse.gsub(/\u00A0/, "")}"
        sleep(0.25)
      end
    end
    puts "***"
  end

  def input_manager
    input = gets.strip
    if input.upcase == "TODAY"
      display_todays_passage
      input_manager
    elsif input.upcase == "UPDATE"
      update_todays_passage
      input_manager
    elsif input.upcase == "MENU"
      menu
      input_manager
    elsif input.upcase == "FULL"
      display_full_chapter
      input_manager
    elsif input.upcase == "LOOKUP" || input.upcase == "LOOK UP"
      puts "***"
      puts "I'm sorry, that functionality hasn't been prgrammed yet!"
      puts "Ask me something else!"
      puts "***"
      input_manager
    elsif input.upcase == "EXIT" || input.upcase == "END"
      puts "***"
      puts "Amen."
      puts "***"
    else
      puts "***"
      puts "I'm not sure what you mean by that... try again!"
      input_manager
    end
  end
end
