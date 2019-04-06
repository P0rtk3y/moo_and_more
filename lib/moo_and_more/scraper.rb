class MooAndMore::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.collectivenouns.biz/list-of-collective-nouns/collective-nouns-animals/"))
  end

  def make_categories
    @categories = {}
    list_content = self.get_page.css("tbody")
      list_content.each_with_index do |content, i|
        @categories["#{i.next}"] = content
      end
    @categories
  end

  def get_category_list(input=nil)
    if input != nil
      make_categories
      binding.pry
      @categories["#{input}"].css("td").select.with_index do |lifeform, i|
        if i > 1 && i.even?
          puts "#{i/2}. #{lifeform.text}"
        end
      end
    end
  end

  def get_collective(input, noun)
    get_category_list(input)
    @categories["#{input}"].each do |c|
      MooAndMore::Lifeform.new_from_scraper(c)
    end
  end

end

# def make_categories(input)
#   @categories = {}
#   list_content = self.get_page.css("tbody")
#     list_content.each_with_index do |content, i|
#       @categories["#{i.next}"] = content
#     end
#
#   @categories["#{input}"].css("td").select.with_index do |lifeform, i|
#     if i > 1 && i.even?
#       puts "#{i/2}. #{lifeform.text}"
#     end
#   end
# end


  # def get_list
  #   list = make_categories[:"1"]
  #   list.values.each_with_index do |e, i|
  #
  #     if i >=2
  #       "#{i-1}" + e.css("td")[i].text
  #     binding.pry
  #     end
  #   end
  #   list
  #
  # end



# list_content.each do |category|
#   @category[category.attributes["id"].value.to_sym] = category.css("tbody")
# end
