class Service < ActiveRecord::Base

  has_and_belongs_to_many :parts

  validates_presence_of :name, :price

  cattr_reader :page_limit
  @@page_limit = 10

  def total
    price + parts_total
  end

  def parts_total
    parts.map(&:price).sum
  end

end