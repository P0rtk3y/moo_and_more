class MooAndMore::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.collectivenouns.biz/list-of-collective-nouns/collective-nouns-animals/"))
  end

  def get_categories
    @categories = {}
    list_content = self.get_page.css("tbody")
      list_content.each_with_index do |content, i|
        @categories["#{i.next}".to_sym] = content
    end
    @categories
  end

end

# list_content.each do |category|
#   @category[category.attributes["id"].value.to_sym] = category.css("tbody")
# end
