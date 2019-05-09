class CreateStatusobras < ActiveRecord::Migration
  def change
    create_table :statusobras do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end
