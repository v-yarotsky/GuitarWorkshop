class CreatePartCategories < ActiveRecord::Migration
  def self.up
    create_table :part_categories do |t|
      t.string :name,         :null => false,  :limit => 60
      t.string :description,  :default => nil, :limit => 500

      t.timestamps
    end
  end

  def self.down
    drop_table :part_categories
  end
end
