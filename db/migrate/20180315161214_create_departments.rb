class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :department_number
      t.integer :building_id

      t.timestamps null: false
    end
  end
end
