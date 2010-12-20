class Orderline < ActiveRecord::Base
  belongs_to :service
  belongs_to :order

  validates_presence_of :service_id, :count

  after_save { order.update_state }

  accepts_nested_attributes_for :service

  scope :complete, where("done = true")

  def total
    service.total * count
  end

  def service_total
    service.price * count
  end

  def parts_total
    service.parts_total * count
  end

end
