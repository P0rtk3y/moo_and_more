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

  def self.find(input, noun)
    total = self.all.select{|list_item| input == list_item.category}.count
    if noun.to_i > total
      puts ""
      puts "--------------"
      puts "INVALID ENTRY!"
      puts "--------------"
    end

    self.all.detect do |list_item|
      if input == list_item.category && noun.to_i == list_item.id
        puts ""
        puts "The collective noun(s) for #{list_item.name.upcase}:"
        puts "|   #{list_item.id}. #{list_item.noun.upcase}   |"
        puts ""
      end
    end
  end


end
