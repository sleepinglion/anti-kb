class CreateFaqCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :faq_categories do |t|
      t.string :title,:null=>false
      t.integer :faqs_count, null: false, default: 0
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end
  end
end
