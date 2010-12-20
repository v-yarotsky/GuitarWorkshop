module OrderlineHelper

  def orderline_total(orderline)
    format_price(orderline.service.price * orderline.count)
  end

end