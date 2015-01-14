# Preview all emails at http://localhost:3000/rails/mailers/notifier
class NotifierPreview < ActionMailer::Preview
  def new_post
    sm = Sm.first
    new_posts = {
      101 => 'First post',
      102 => 'Second post',
      103 => 'Third post',
      104 => 'Super awesome post with some very, very, very, very, very, very, very, very, very, very, very, very, very long (or even longer) title ',
      105 => 'Last, but no least post'
    }
    Notifier.new_post(sm, new_posts)
  end
end
