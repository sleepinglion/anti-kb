class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.references :faq_category,:null=>false      
      t.string :title,:null=>false
      t.boolean :enabled, :null=>false, :default=>true      
      t.timestamps
    end
    
    create_table :faq_contents do |t|
      t.string :content 
    end
    
    add_index :faqs, :faq_category_id  
  end
end
