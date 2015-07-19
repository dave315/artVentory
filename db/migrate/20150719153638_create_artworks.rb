class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.integer :series_number
      t.date :date
      t.text :description
      t.string :photo, null: false
      t.integer :category_id
    end
  end
end
