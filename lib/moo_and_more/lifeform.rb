class MooAndMore::Lifeform

  attr_accessor :category, :id, :name, :noun

  @@all = []

  def self.new_from_scraper(category, i, lifeform)
    self.new(
      category,
      i/2,
      lifeform.text
    )
  end

  def initialize(category, id=nil, name=nil, noun=nil)
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
