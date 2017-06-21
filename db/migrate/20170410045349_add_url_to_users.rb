class AddUrlToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :url, :string, :limit=>200, after: 'compliments_count'
  end
end
