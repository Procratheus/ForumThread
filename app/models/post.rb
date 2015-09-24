class Post < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user

  def send_notifications!
    users = self.forum.users.uniq - [self.user]
    users.each do |user|
      NotificationMailer.post_notification(user, self).deliver_now
    end
  end
end
