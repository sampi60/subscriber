class Sm < ActiveRecord::Base
  def search_for_new_posts
    require 'open-uri'

    posts = {}
    start = last_post.to_i + 1
    stop =  last_post.to_i + 10

    (start..stop).each do |id|
      page = open_page(id)
      next unless page.css('.mainPanel').present?
      posts[id.to_s] = page.css('.mainPanel h2').text
    end

    if posts.any?
      increment_post_id(posts.keys.last)
      posts
    end
  end


  private

    def open_page(id)
      new_url = "#{uri}p#{id}"
      Nokogiri::HTML(open(new_url))
    end

    def increment_post_id(id)
      self.last_post = id
      self.save!
    end
end
