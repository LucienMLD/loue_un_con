class AddAddressToPerformance < ActiveRecord::Migration[5.0]
  def change
    add_column :performances, :address, :string
  end
end
