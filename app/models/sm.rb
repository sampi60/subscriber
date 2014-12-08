class Sm < ActiveRecord::Base
  def search_for_new_post
    require 'open-uri'

    (1..10).each do |x|
      @x = x
      page = open_page
      new_post_title = page.css('.mainPanel h2').text if page.css('.mainPanel').present?

      if new_post_title
        increment_post_id(self)
        return new_post_title
      end
    end
    nil
  end


  private

    def open_page
      Nokogiri::HTML(open(new_post_url))
    end

    def new_post_id
      last_post.to_i + @x
    end

    def new_post_url
      "#{uri}p#{new_post_id}"
    end

    def increment_post_id(sm)
      sm.last_post = new_post_id
      sm.save!
    end
end
