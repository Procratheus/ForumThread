# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def post_notification
    NotificationMailer.post_notification(User.first, Post.first).deliver_now
  end
end
