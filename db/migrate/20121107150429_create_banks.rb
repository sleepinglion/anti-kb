class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :title, :limit=>60, :null=>false
      t.integer :compliments_count, :default=>0, :null=>false
      t.string :photo, :null=>false
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end
  end
end
