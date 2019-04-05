class MooAndMore::Scraper

  def get_page
    doc = Nokogiri::HTML(open("http://www.collectivenouns.biz/list-of-collective-nouns/collective-nouns-animals/"))
    binding.pry

  end



end
