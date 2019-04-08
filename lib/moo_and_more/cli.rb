#Our CLI Controller

class MooAndMore::CLI

  def call
    puts "          ______________________________________________"
    puts "          |                      _,,,_                 |"
    puts "          |        (o)_(o)      (d. .b)      cCcCc     |"
    puts "          |        | . . |       ((Y))      (^ o ^)    |"
    puts "          |        (= X =)        | |      @|(   )|@   |"
    puts "          |      |_('')('')   |_('')('')       ^^      |"
    puts "----------------------------------------------------------------------"
    puts "  WELCOME TO MOO & MORE -- A COLLECTIVE NOUN GENERATOR FOR LIFEFORMS "
    puts "----------------------------------------------------------------------"
    MooAndMore::Scraper.new.get_page
    start
  end

  def start
    puts ""
    puts <<-DOC
                   |CATEGORIES|
    Which category would you like to see?
         1. Mammals & Marsupials
         2. Birds
         3. Fish
         4. Reptiles & Amphibians
         5. Invertebrates (insects, mollusks, etc.)
         6. Single-Celled Organisms
    Enter: 1 - 6
    ------------------------------------------------
    DOC
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
        puts "--------------"
        puts "INVALID NUMBER!"
        puts "--------------"
        puts "Please select a number from the category list or exit by entering 'DEPART'"
        self.get_input
    end
  end

  def get_or_add_noun(input)
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
         If yes, enter: 'MOOVE OVER'
         To return to the main menu, enter: 'MORE LISTS'
         To exit Moo & More, enter: 'DEPART'"

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
        puts "INVALID ENTRY!"
        puts "--------------"
        get_next(input)
    end
  end

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
    puts "----------------------------------"
    puts "THANK YOU FOR VISITING MOO & MORE "
    puts "     ()~()~~~________ /^     "
    puts "      ('')__( @  @  @ )     "
    puts "    @_[..]  | / +++ |/      "
    puts "            ||      || * *  "
    puts "     |||||||||||||||||||||| "
    puts "----------------------------------"
  end

end
