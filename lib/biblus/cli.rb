class Biblus::CLI

  def call
    welcome
    menu
    input_manager
  end

  def welcome
    puts "Welcome to the Bible!"
    puts "I can look up any bible verse, or tell you today's passage!"
  end

  def menu
    puts "To see today's passage, type 'today'"
    puts "To get started looking up a verse, type 'lookup' (note: not functional yet)"
    puts "You can always type 'menu' to see these options again!"
  end

  def input_manager
    input = gets.strip
    if input.upcase == "TODAY"
      passage = Biblus::BibleScraper.new.scrape_biblegateway
      puts "Today's passage is #{passage.book} #{passage.chapter}:#{passage.verse[0]}"
      puts "#{passage.text}"
      input_manager
    elsif input.upcase == "MENU"
      menu
      input_manager
    elsif input.upcase == "EXIT"
      puts "Amen."
    else
      puts "I'm not sure what you mean by that... try again!"
      input_manager
    end
  end

end
