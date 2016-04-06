class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.string :trainno
      t.string :dest
      t.string :source

      t.timestamps null: false
    end
  end
end
