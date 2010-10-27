class NotificationMailer < ActionMailer::Base
  
  def signup(event, contributor, items)
    subject    event.title + ' Signup Confirmation'
    recipients contributor.email
    from       '"' + event.title + '" <noreply@noreply.com>'
    sent_on    Time.now
    
    body       :contributor => contributor, :event => event, :items => items
  end

end
