# encoding: utf-8
namespace :sm do
  require 'open-uri'

  desc 'Prints last [START] headers.'
  task get_all_posts: :environment do
    start = ENV['START'].blank? ? 500 : ENV['START'].to_i
    sm = Sm.where(name: 'SM Chełm').first

    (start..sm.last_post.to_i).each do |id|
      url = "#{sm.uri}p#{id}"
      page = Nokogiri::HTML(open(url))
      next unless page.css('.mainPanel').present?
      header = "#{sm.uri}p#{id} -> "
      header << page.css('.mainPanel h2').text
      header << " (#{page.css('.mainPanel .date').text})" if page.css('.mainPanel .date').text.length > 0
      p header
    end
  end

  desc 'Check for new posts'
  task check: :environment do
    sm = Sm.where(name: 'SM Chełm').first
    new_posts = sm.search_for_new_posts
    Notifier.new_post(sm, new_posts).deliver if new_posts.any?
  end

end
