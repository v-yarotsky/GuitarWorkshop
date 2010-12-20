class CreateServices < ActiveRecord::Migration

  def self.up
    create_table :services do |t|
      t.string :name,          :null => false,  :limit => 60
      t.string :description,   :default => nil, :limit => 500
      t.decimal :price,        :null => false

      t.timestamps
    end

    create_table :parts_services, :id => false do |t|
      t.integer :part_id
      t.integer :service_id
    end

    add_index :parts_services, [:part_id, :service_id], :unique => true
  end

  def self.down
    drop_table :services
    drop_table :parts_services
    remove_index :parts_services, :columns => [:part_id, :service_id]
  end

end
