class CreateArticles < ActiveRecord::Migration[4.2]
  def change
    create_table :articles do |t|
      t.string :title, :null=>false, :limit=>60
      t.string :url, :null=>false
      t.text :description, :null=>false
      t.boolean :enable, :null=>false, :default=>true      
      t.timestamps
    end
  end
end
