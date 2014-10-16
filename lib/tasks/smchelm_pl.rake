# encoding: utf-8
namespace :site do
  namespace :smchelm_pl do
    require 'open-uri'

    desc 'Prints last [START] headers.'
    task get_all_posts: :environment do
      start = ENV['START'].blank? ? 500 : ENV['START'].to_i
      site = Site.where(name: 'SM Chełm').first

      (start..site.last_post.to_i).each do |id|
        url = "#{site.uri}p#{id}"
        page = Nokogiri::HTML(open(url))
        next unless page.css('.mainPanel').present?
        header = "#{site.uri}p#{id} -> "
        header << page.css('.mainPanel h2').text
        header << " (#{page.css('.mainPanel .date').text})" if page.css('.mainPanel .date').text.length > 0
        p header
      end
    end

  end
end
