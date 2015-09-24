class NotificationMailer < ApplicationMailer

  def post_notification(user, post)
    @user = user
    @post = post

    mail(
      to: "#{user.email}",
      subject: "[ForumThread] New post in #{post.forum.title}"
    )
  end
end
