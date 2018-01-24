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
  end

  def input_manager
    input = gets.strip
    if input.upcase == "TODAY"
      puts "Life in the Community of Christ. Brothers, even if a person is caught in some transgression, you who are spiritual should correct that one in a gentle spirit, looking to yourself, so that you also may not be tempted."
    else
      puts "I'm not sure what you mean by that... try again!"
      menu
      input_manager
    end
  end

end
