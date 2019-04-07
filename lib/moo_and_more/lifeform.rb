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
    self.all.detect do |list_item|
      if input == list_item.category && noun.to_i == list_item.id
        puts "The collective noun(s) for #{list_item.name.upcase} include #{list_item.noun.upcase}"
      end
    end
  end


end
