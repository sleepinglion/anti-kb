class CreateFaqs < ActiveRecord::Migration[4.2]
  def change
    create_table :faqs do |t|
      t.references :faq_category, null: false
      t.string :title, null: false, limit: 60
      t.boolean :enable, null: false, default: true
      t.timestamps null: false
    end

    create_table :faq_contents do |t|
      t.string :content
    end

    add_index :faqs, :faq_category_id
  end
end
