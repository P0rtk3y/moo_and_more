class MooAndMore::Lifeform

  attr_accessor :category, :id, :name, :noun

  @@all = []

  def self.new_from_scraper(category, id, lifeform, noun=nil)
    self.new(
      category,
      id,
      lifeform.text,
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

end
