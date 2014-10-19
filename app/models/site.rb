class Site < ActiveRecord::Base
  def search_for_new_post
    require 'open-uri'
    page = Nokogiri::HTML(open(new_post_url))
    page.css('.mainPanel').present?
  end

  def new_post_id
    last_post.to_i + 1
  end

  def new_post_url
    "#{uri}p#{new_post_id}"
  end
end
