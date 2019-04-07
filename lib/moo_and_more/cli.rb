#Our CLI Controller

class MooAndMore::CLI

  def call
    puts "                            _,,,_"
    puts "                           (d. .b)"
    puts "                            ((Y))"
    puts "                             | |"
    puts "                         \_('')('')"
    puts "Welcome to Moo and More -- A Collective Noun Generator for Lifeforms!"
    MooAndMore::Scraper.new.get_page
    get_input
  end

  def get_input
    puts ""
    puts <<-DOC
    Which category would you like to see?
         1. Mammals & Marsupials
         2. Birds
         3. Fish
         4. Reptiles & Amphibians
         5. Invertebrates (including insects, mollusks, etc.)
         6. Single-Celled Organisms
    Enter: 1 - 6
    DOC
    input = gets.strip

    print_category(input)
    puts ""
    puts "Select a number to see the collective noun:"
    MooAndMore::Scraper.new.get_category_list(input)



  # #
  # #   puts ""
  # #   puts "Type the number next to the lifeform to see its collective noun"
  # #   input = gets.strip
  # #
  # #   lifeform = MooAndMore::Lifeform.find(input.to_i)
  # #   print_lifeform(lifeform)
  # #
  # #   puts ""
  # #   puts "Would you like to see another collective noun for a lifeform\n
  # #        in the same category? (If yes, enter: Moove Over.\n
  # #        To return to the main menu, enter: More Lists.\n
  # #        You may exit Moo and More at any time by entering: Exit"
  # #   input = gets.strip.upcase
  # #   if input == "MOOVE OVER"
  # #     print_lifeform(lifeform)
  # #   elsif input == "MORE LISTS"
  # #     start
  # #   else
  # #     "Thank you for visiting Moo and More!"
  # #     exit
  # #   end
  # #
  end
  #
  def print_category(input)
    case input
      when "1"
        puts "-----------MAMMALS & MARSUPIALS------------"
        puts "         -------------------------    "
      when "2"
        puts "----------------BIRDS----------------"
        puts "        ----------------------    "
      when "3"
        puts "---------------FISH-------------------"
        puts "       ---------------------   "
      when "4"
        puts "----------REPTILES & AMPHIBIANS-----------"
        puts "      -----------------------------   "
      when "5"
        puts "---INVERTEBRATES (insects, mollusks, etc.)---"
        puts "      ------------------------------       "
      when "6"
        puts "-------SINGLE-CELLED ORGANISMS-------"
        puts "    -----------------------------    "
    end
  end

end
