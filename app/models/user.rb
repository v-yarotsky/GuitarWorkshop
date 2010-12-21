class User < ActiveRecord::Base

  acts_as_authentic

  belongs_to :role
  has_many :orders

  validates_presence_of :name, :email, :phone, :password, :password_confirmation, :role

  def has_role?(role)
    self.role == role
  end

  def home_path
    "#{role.controller}_path"
  end

  def reset_password
    notify_observers :password_reset
  end
end