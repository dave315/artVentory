class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text :description
      t.date :series_date
      t.integer :total_printed
    end
  end
end
