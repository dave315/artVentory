class ChangeSeriesNumberColumn < ActiveRecord::Migration
  def change
    rename_column :artworks, :series_number, :number_in_series 
  end
end
