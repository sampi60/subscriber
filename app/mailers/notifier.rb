class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def new_post(site)
    @site = site
    mail(to: 'sampi60@gmail.com', subject: 'New post on smchelm.pl')
  end
end
