class AddColumnsToItems < ActiveRecord::Migration
  def change
    add_column :items, :description, :text
    add_column :items, :price, :integer
  end
end
