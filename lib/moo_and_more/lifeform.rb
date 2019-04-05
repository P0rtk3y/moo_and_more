class MooAndMore::Lifeform

  attr_accessor :category, :id, :name, :noun

  @@all = []

  def initialize(category, id, name, noun)
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
