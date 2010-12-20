class CreateParts < ActiveRecord::Migration
  def self.up
    create_table :parts do |t|
      t.string :name,               :null => false,  :limit => 60
      t.string :description,        :default => nil, :limit => 500
      t.decimal :price,             :null => false
      t.integer :manufacturer_id,   :null => false
      t.integer :part_category_id,  :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :parts
  end
end
