class User < ActiveRecord::Base

  acts_as_authentic

  belongs_to :role
  has_many :orders


  def has_role?(role)
    self.role == role
  end

  def home_path
    "#{role.controller}_path"
  end

end