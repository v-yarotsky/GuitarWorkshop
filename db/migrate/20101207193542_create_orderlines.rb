class CreateOrderlines < ActiveRecord::Migration
  def self.up
    create_table :orderlines do |t|
      t.integer :order_id,     :null => false
      t.integer :service_id,   :null => false
      t.integer :count,    :null => false
      t.boolean :done, :default => false

      t.timestamps
    end

    add_index :orderlines, :order_id
  end

  def self.down
    drop_table :orders
  end
end
