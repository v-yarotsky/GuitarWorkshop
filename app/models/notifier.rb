class Notifier < ActionMailer::Base

  default_url_options[:host] = "guitarworkshop.by"
  default :from => "noreply@guitarworkshop.by"

  layout 'notifier_layout'

  def password_reset_instructions(user)
    subject       t "reset_password.reset_instruction_title"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end

  def user_registration_notification(user)
    subject       t "mail.registration_info_title"
    recipients    user.email
    sent_on       Time.now
    body          :login => user.login, :password => user.password
  end

  def order_accepted_notification(order)
    subject       t "mail.order_accepted_title", :number => order.id
    recipients    order.client.email
    sent_on       Time.now
    body          :number => order.id, :code => order.code
  end

  def order_completed_notification(order)
    subject       t "mail.order_completed_title", :number => order.id
    recipients    order.client.email
    sent_on       Time.now
    body          :number => order.id
  end

end