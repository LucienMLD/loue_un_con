class ChangeTypeColumnToBooking < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :start_date, :datetime
    change_column :bookings, :end_date, :datetime
  end
end
