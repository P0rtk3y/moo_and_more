class MooAndMore::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.collectivenouns.biz/list-of-collective-nouns/collective-nouns-animals/"))
  end

end
