class Notifier < ActionMailer::Base
  include Roadie::Rails::Automatic

  default from: "from@example.com"

  def new_post(sm, new_posts)
    @sm = sm
    @new_posts = new_posts
    recipients = eval "#{ENV['SMCHELM_RECIPIENTS']}"
    mail(to: recipients, subject: 'New post on smchelm.pl')
  end
end
