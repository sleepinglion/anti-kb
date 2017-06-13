class CreateProposes < ActiveRecord::Migration
  def change
    create_table :proposes do |t|
      t.references :user, :null=>false
      t.string :title, :limit=>60, :null=>false
      t.text :content
      t.boolean :enable, :null=>false, :default=>true      
      t.timestamps
    end

    add_index :proposes, :user_id
  end
end
