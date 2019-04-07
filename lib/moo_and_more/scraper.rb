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
    puts "Select a number to see the collective noun:"
      make_categories
      @categories["#{input}"].css("td").select.with_index do |lifeform, i|
        if i > 1 && i.even?
          puts "#{i/2}. #{lifeform.text}"
        end
      end
  end

  def add_noun
    make_categories
    @categories.each do |category, content|
      content.css("td").each_with_index do |list_item, i|
        if i > 1 && i.even?
          id = i/2
          lifeform = list_item.text
          MooAndMore::Lifeform.new_from_scraper(category, id, lifeform)
        elsif i > 2 && i.odd?
          MooAndMore::Lifeform.all.select do |item|
            if item.id == ((i-1)/2)
              item.noun = list_item.text.gsub("\u00C2", "")
            end
          end
        end
      end
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
