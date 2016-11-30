class CreateImprove < ActiveRecord::Migration
  def change
    create_table :improve do |t|   
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
