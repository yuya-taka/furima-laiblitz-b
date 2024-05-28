class CreateNewCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :new_categories do |t|
      t.string :name
      t.string :ancestry
      t.timestamps
    end
  end
end
