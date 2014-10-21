class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def new_post(site)
    @site = site
    recipients = eval "#{ENV['SMCHELM_RECIPIENTS']}"
    mail(to: recipients, subject: 'New post on smchelm.pl')
  end
end
