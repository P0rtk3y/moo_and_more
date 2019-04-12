class MooAndMore::Lifeform

  attr_accessor :category, :id, :name, :noun

  @@all = []

  def self.new_from_scraper(category, id, lifeform, noun=nil)
    self.new(
      category,
      id,
      lifeform,
      noun
    )
  end

  def initialize(category=nil, id=nil, name=nil, noun=nil)
    @category = category
    @id = id
    @name = name
    @noun = noun
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_noun(input, noun)
    total = self.all.select{|list_item| input == list_item.category}.count
    if noun.to_i > total
      puts ""
      puts "--------------"
      puts "INVALID ENTRY!".red
      puts "--------------"
    end

    self.all.detect do |list_item|
      if input == list_item.category && noun.to_i == list_item.id
        puts ""
        puts "A group of"+" #{list_item.name.upcase}".green+" is called a:"
        puts "|   "+"#{list_item.id}.".yellow + " #{list_item.noun.upcase}".green + "  |"
        puts ""
      end
    end
  end


end
