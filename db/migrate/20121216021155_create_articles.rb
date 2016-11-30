class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|   
      t.string :title, :null=>false, :limit=>60
      t.string :url, :null=>false
      t.text :description, :null=>false
      t.boolean :enabled, :null=>false, :default=>true      
      t.timestamps
    end
  end
end
