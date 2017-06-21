class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.float :latitude, precision: 11, scale: 8
      t.float :longitude, precision: 11, scale: 8
      t.float :distance, precision: 11, scale: 8
      t.timestamps
    end
  end
end
