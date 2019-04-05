class MooAndMore::CLI

  def call
    puts "Welcome to Moo and More -- A Collective Noun Generator for Lifeforms!"
    # MooAndMore::Scraper.new.make_lifeform_lists
    # start
  end

  # def start
  #   puts ""
  #   puts "Which category would you like to see?\n
  #        1. Mammals & Marsupials\n
  #        2. Birds\n
  #        3. Fish\n
  #        4. Reptiles and Amphibians\n
  #        5. Invertebrates (including insects, mollusks, etc.)\n
  #        6. Single-Celled Organism\n
  #        Enter (1 - 6)"
  #   input = gets.strip.to_i
  # 
  #   print_category(input)
  # 
  #   puts ""
  #   puts "Type the number next to the lifeform to see its collective noun"
  #   input = gets.strip
  # 
  #   lifeform = MooAndMore::Lifeform.find(input.to_i)
  #   print_lifeform(lifeform)
  # 
  #   puts ""
  #   puts "Would you like to see another collective noun for a lifeform\n
  #        in the same category? (If yes, enter: Moove Over.\n
  #        To return to the main menu, enter: More Lists.\n
  #        You may exit Moo and More at any time by entering: Exit"
  #   input = gets.strip.upcase
  #   if input == "MOOVE OVER"
  #     print_lifeform(lifeform)
  #   elsif input == "MORE LISTS"
  #     start
  #   else
  #     "Thank you for visiting Moo and More!"
  #     exit
  #   end
  # 
  # end

end 
