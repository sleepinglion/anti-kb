# encoding: utf-8

class CreateReportCategories < ActiveRecord::Migration
  def change
    create_table :report_categories do |t|
      t.string :title, :limit=>60, :null=>false
      t.integer :reports_count, :default=>0, :null=>false
      t.boolean :enabled, :null=>false, :default=>true      
      t.timestamps
    end
  end
end
