#Our CLI Controller

class MooAndMore::CLI

  def call
    puts "          ____________________________________________"
    puts "          |                    _,,,_                 |"
    puts "          |        (o)_(o)    (d. .b)      cCcCc     |"
    puts "          |        | . . |     ((Y))      (^ o ^)    |"
    puts "          |        (= X =)      | |      @|(   )|@   |"
    puts "          |      |_('')('') |_('')('')       ^^      |"
    puts "----------------------------------------------------------------------"
    puts " WELCOME TO MOO AND MORE -- A COLLECTIVE NOUN GENERATOR FOR LIFEFORMS "
    puts "----------------------------------------------------------------------"
    MooAndMore::Scraper.new.get_page
    # start
    get_collective
  end

  def start
    puts ""
    puts <<-DOC
    Which category would you like to see?
         1. Mammals & Marsupials
         2. Birds
         3. Fish
         4. Reptiles & Amphibians
         5. Invertebrates (insects, mollusks, etc.)
         6. Single-Celled Organisms
    Enter: 1 - 6
    DOC
  end

  def get_input
    input = gets.strip
    case input.to_s.upcase
      when "1", "2", "3", "4", "5", "6"
        print_category(input)
        puts ""
        MooAndMore::Scraper.new.get_category_list(input)
        # get_noun
      when "DEPART"
        goodbye
      else
        puts "Invalid number. Please select a number from the category list or exit by entering 'DEPART'"
    end
  end

  def get_collective
    # lifeform = gets.strip
    MooAndMore::Scraper.new.find_noun
    MooAndMore::Lifeform.all
    # MooAndMore::Lifeform.find(lifeform)
  end
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
  #
  def print_category(input)
    case input
      when "1"
        puts "-----------MAMMALS & MARSUPIALS------------"
        puts "           --------------------    "
      when "2"
        puts "----------------BIRDS----------------"
        puts "                -----    "
      when "3"
        puts "---------------FISH-------------------"
        puts "               ----  "
      when "4"
        puts "----------REPTILES & AMPHIBIANS-----------"
        puts "          ---------------------   "
      when "5"
        puts "---INVERTEBRATES (INSECTS, MOLLUSKS, ETC.)---"
        puts "   ---------------------------------------       "
      when "6"
        puts "-------SINGLE-CELLED ORGANISMS-------"
        puts "       -----------------------    "
    end
  end

  def goodbye
    puts "Thank you for visiting Moo and More!"
  end

end
