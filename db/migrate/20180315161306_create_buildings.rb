class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :building_type

      t.timestamps null: false
    end
  end
end
