class Site < ActiveRecord::Base
  def self.search_for_new_post(site)
    require 'open-uri'
    last_post_id = site.last_post.to_i + 1
    last_post_url = "#{site.uri}p#{last_post_id}"
    page = Nokogiri::HTML(open(last_post_url))
    page.css('.date').present?
  end
end
