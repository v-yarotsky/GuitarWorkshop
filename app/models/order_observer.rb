class OrderObserver < ActiveRecord::Observer

  observe :order

  def after_save(order)
    Notifier.deliver_order_completed_notification(order) if order.done?
  end

  def after_create(order)
    Notifier.deliver_order_accepted_notification(order)
  end

end