class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name,              :null => false, :limit => 40
      t.string :controller,        :null => false
    end
  end

  def self.down
    drop_table :roles
  end
end
