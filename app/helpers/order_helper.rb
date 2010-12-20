module OrderHelper

  def order_status(order)
    t "orders.statuses.#{order.status.gsub(/ /, '').underscore}"
  end


end