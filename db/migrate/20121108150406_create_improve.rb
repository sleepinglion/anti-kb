class CreateImprove < ActiveRecord::Migration[4.2]
  def change
    create_table :improve do |t|
      t.string :title
      t.text :content
      t.boolean :enable, :null=>false, :default=>true      
      t.timestamps
    end
  end
end
