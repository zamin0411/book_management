class AddDescriptionToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :description, :text
  end
end
