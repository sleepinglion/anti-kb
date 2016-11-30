class CreateComplimentCategories < ActiveRecord::Migration
  def change
    create_table :compliment_categories do |t|
      t.string :title, :limit=>60, :null=>false
      t.integer :compliments_count, :default=>0, :null=>false
      t.boolean :enabled, :null=>false, :default=>true      
      t.timestamps
    end
  end
end
