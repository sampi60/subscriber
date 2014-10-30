class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def new_post(sm, new_post_title)
    @sm = sm
    @new_post_title = new_post_title
    recipients = eval "#{ENV['SMCHELM_RECIPIENTS']}"
    mail(to: recipients, subject: 'New post on smchelm.pl')
  end
end
