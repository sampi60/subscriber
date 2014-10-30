class Sm < ActiveRecord::Base
  def search_for_new_post
    require 'open-uri'
    page = Nokogiri::HTML(open(new_post_url))
    new_post_title = page.css('.mainPanel h2').text if page.css('.mainPanel').present?

    increment_post_id(self) if new_post_title

    new_post_title
  end

  def new_post_id
    last_post.to_i + 1
  end

  def new_post_url
    "#{uri}p#{new_post_id}"
  end

  private

  def increment_post_id(sm)
    sm.last_post = new_post_id
    sm.save!
  end
end
