class AddColumnToPerformance < ActiveRecord::Migration[5.0]
  def change
    add_column :performances, :full_address, :string
    add_column :performances, :zip_code, :string
    add_column :performances, :city, :string
    add_column :performances, :country, :string
  end
end
