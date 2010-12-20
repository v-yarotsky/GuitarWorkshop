class Order < ActiveRecord::Base

  ORDER_STATUSES = [ "Pending", "In Progress", "Complete"]

  has_many :orderlines, :dependent => :destroy
  belongs_to :manager, :class_name => "User"
  belongs_to :client

  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :orderlines, :allow_destroy => true

  validates_presence_of :orderlines

  validates_associated :client, :if => ->(order){ order.client_id.blank? }
  cattr_reader :page_limit
  @@page_limit = 10

  before_create :generate_code

  def total
    orderlines.map(&:total).sum
  end

  def status
    done_orderlines = orderlines.complete.count
    return ORDER_STATUSES[0] if done_orderlines == 0
    return ORDER_STATUSES[2] if done_orderlines == orderlines.count
    ORDER_STATUSES[1]
  end

  def done?
    status == ORDER_STATUSES[2]
  end

  def in_progress?
    status == ORDER_STATUSES[1]
  end

  def pending?
    status == ORDER_STATUSES[0]
  end

  def update_state
    completed_at =  done? ? Time.now : nil
  end

  protected

  def generate_code
    characters = ('A'..'Z').to_a + ('0'..'9').to_a
    code = ""
    0.upto 6 do |i| code[i] = characters[rand characters.count] end
    self.code = code
  end

end