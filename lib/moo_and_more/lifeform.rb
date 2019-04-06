class MooAndMore::Lifeform

  attr_accessor :id, :name, :noun

  @@all = []

  # def self.new_from_scraper(c)
  #   self.new(
  #     c.values[0].css("td")[0].text,
  #     c.
  #   )
  # end

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
