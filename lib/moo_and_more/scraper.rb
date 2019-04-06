class MooAndMore::Scraper

  def get_page
    @@all = []
    doc = Nokogiri::HTML(open("http://www.collectivenouns.biz/list-of-collective-nouns/collective-nouns-animals/"))

    categories = doc.css("div.entry-content h2")
      categories.each do |category|
        category.css 
        binding.pry
      end
  end



end
