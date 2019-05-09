class CreateAtendimentos < ActiveRecord::Migration
  def change
    create_table :atendimentos do |t|
      t.belongs_to :building, index: true, foreign_key: true
      t.belongs_to :usuario, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
