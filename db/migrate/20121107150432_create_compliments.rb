class CreateCompliments < ActiveRecord::Migration[4.2]
  def change
    create_table :compliments do |t|
      t.references :bank, :null=>false
      t.references :compliment_category, :null=>false
      t.references :user, :null=>false
      t.string :title,:limit=>60, :null=>false
      t.integer :default_view_count, :null=>false, :default=>0      
      t.integer :compliment_comment_count, :null=>false ,:default=>0
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end

    create_table :compliment_contents do |t|
      t.text :content, :null=>false
    end

    add_index :compliments, :bank_id
    add_index :compliments, :compliment_category_id
    add_index :compliments, :user_id
  end
end
