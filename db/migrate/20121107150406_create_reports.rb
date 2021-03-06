class CreateReports < ActiveRecord::Migration[4.2]
  def change
    create_table :reports do |t|
      t.references :report_category, :null=>false
      t.references :user, :null=>false
      t.string :title, :limit=>60, :null=>false
      t.integer :default_view_count, :null=>false, :default=>0      
      t.integer :report_comments_count, :null=>false, :default=>0
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps null: false
    end

    create_table :report_contents do |t|
      t.text :content, :null=>false
    end

    add_index :reports, :report_category_id
    add_index :reports, :user_id
  end
end
