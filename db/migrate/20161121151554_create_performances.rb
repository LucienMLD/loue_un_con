class CreatePerformances < ActiveRecord::Migration[5.0]
  def change
    create_table :performances do |t|
      t.string :speciality
      t.integer :price
      t.integer :area
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
