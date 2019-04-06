class MooAndMore::Scraper

  def get_page
    doc = Nokogiri::HTML(open("http://www.collectivenouns.biz/list-of-collective-nouns/collective-nouns-animals/"))
    @@all = []
    
    categories = doc.css("div.entry-content table")
      @category = {}
      categories.each do |category|
        @category[category.attributes["id"].value.to_sym] = []
      end

    name = doc.css()

  end



end
