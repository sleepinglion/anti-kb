class CreateImprove < ActiveRecord::Migration[4.2]
  def change
    create_table :improve do |t|
      t.string :title, :limit=>60, :null=>false
      t.text :content, :null=>false
      t.boolean :enable, :null=>false, :default=>true      
      t.timestamps null: false
    end
  end
end
