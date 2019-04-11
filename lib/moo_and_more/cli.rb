#Our CLI Controller

class MooAndMore::CLI

  def call
    puts "          ______________________________________________"
    puts "          |                      "+"_,,,_".green+"                 |"
    puts "          |        "+"(o)_(o)      (d. .b)      cCcCc".green+"     |"
    puts "          |        "+"| . . |       ((Y))      (^ o ^)".green+"    |"
    puts "          |        "+"(= X =)        | |      @|(   )|@".green+"   |"
    puts "          |      "+"|_('')('')   |_('')('')       ^^".green+"      |"
    puts "----------------------------------------------------------------------"
    puts "  Welcome to MOO & MORE -- A COLLECTIVE NOUN GENERATOR FOR LIFEFORMS ".green
    puts "----------------------------------------------------------------------"
    MooAndMore::Scraper.new.get_page
    start
  end

  def start
    puts ""
    puts <<-DOC

  ----------------|CATEGORIES|-------------------

    Which category would you like to see?
         1. Mammals & Marsupials
         2. Birds
         3. Fish
         4. Reptiles & Amphibians
         5. Invertebrates (insects, mollusks, etc.)
         6. Single-Celled Organisms
    Enter: 1 - 6
    DOC
    puts ""
    get_input
  end

  def get_input
    input = gets.strip
    case input.to_s.upcase
      when "1", "2", "3", "4", "5", "6"
        print_category(input)
        puts ""
        MooAndMore::Scraper.new.get_category_list(input)
        get_or_add_noun(input)
      when "DEPART"
        goodbye
      else
        puts ""
        puts "---------------"
        puts "INVALID ENTRY!".red
        puts "---------------"
        puts "Please select a number from the categories list or exit by entering"+" 'DEPART'".red
        self.get_input
    end
  end

  def get_or_add_noun(input)
    puts ""
    puts "Select a number to see the collective noun(s):"
    noun = gets.strip
    if MooAndMore::Lifeform.all.empty?
      MooAndMore::Scraper.new.add_noun
      MooAndMore::Lifeform.find_noun(input, noun)
    else
      MooAndMore::Lifeform.find_noun(input, noun)
    end
    get_next(input)
  end

  def get_next(input)
    puts "Would you like to see another collective noun for a lifeform in the same category?
         | If yes, enter:" +"'MOOVE OVER'".red + "                     |
         | To return to the main menu, enter:"+"'MORE LISTS'".red+" |
         | To exit Moo & More, enter:"+" 'DEPART'".red+"            |"
    option = gets.strip.upcase
    if option == "MOOVE OVER"
        print_category(input)
        MooAndMore::Scraper.new.get_category_list(input)
        get_or_add_noun(input)
    elsif option == "MORE LISTS"
        start
    elsif option == "DEPART"
        goodbye
    else
        puts "--------------"
        puts "INVALID ENTRY!".red
        puts "--------------"
        get_next(input)
    end
  end

  def print_category(input)
    case input
      when "1"
        puts "           --------------------    "
        puts "-----------"+"MAMMALS & MARSUPIALS".yellow+"------------"
        puts "           --------------------    "
      when "2"
        puts "                -----    "
        puts "----------------"+"BIRDS".yellow+"----------------"
        puts "                -----    "
      when "3"
        puts "                ----  "
        puts "----------------"+"FISH".yellow+"-------------------"
        puts "                ----  "
      when "4"
        puts "          ---------------------   "
        puts "----------"+"REPTILES & AMPHIBIANS".yellow+"-----------"
        puts "          ---------------------   "
      when "5"
        puts "   ---------------------------------------       "
        puts "---"+"INVERTEBRATES (INSECTS, MOLLUSKS, ETC.)".yellow+"---"
        puts "   ---------------------------------------       "
      when "6"
        puts "       -----------------------    "
        puts "-------"+"SINGLE-CELLED ORGANISMS".red+"-------"
        puts "       -----------------------    "
    end
  end

  def goodbye
    puts "-------------------------------------"
    puts " THANK YOU FOR VISITING MOO & MORE!!".green
    puts "-------------------------------------"
    puts "     ()~()~~~________ /^     ".green
    puts "      ('')__( @  @  @ )     ".green
    puts "    @_[..]  | / +++ |/      ".green
    puts "            ||      || * *  ".green
    puts "     |||||||||||||||||||||| ".green

  end

end
