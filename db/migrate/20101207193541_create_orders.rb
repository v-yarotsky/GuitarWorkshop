class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :client_id,     :null => false
      t.integer :manager_id,    :null => false
      t.string :description,    :default => nil, :limit => 500
      t.date :completed_at
      t.boolean :paid, :default => false
      t.string :code, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
