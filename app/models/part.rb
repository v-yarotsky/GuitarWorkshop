class Part < ActiveRecord::Base

  has_and_belongs_to_many :services

  belongs_to :part_category
  belongs_to :manufacturer

  validates_presence_of :name, :price, :part_category_id, :manufacturer_id

  attr_accessor :new_part_category_name, :new_manufacturer_name

  before_save ->(){ create_part_category_from_name; create_manufacturer_from_name }

  cattr_reader :page_limit
  @@page_limit = 10

  protected

  def create_part_category_from_name
    create_part_category(:name => new_part_category_name) unless new_part_category_name.blank?
  end

  def create_manufacturer_from_name
    create_manufacturer(:name => new_manufacturer_name) unless new_manufacturer_name.blank?
  end

end