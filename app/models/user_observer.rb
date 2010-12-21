class UserObserver < ActiveRecord::Observer

  observe :user

  def after_create(user)
    Notifier.deliver_user_registration_notification(user)
  end

  def password_reset(user)
    user.reset_perishable_token!
    Notifier.deliver_password_reset_instructions(user)
  end


end