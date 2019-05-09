class CreateAvisos < ActiveRecord::Migration
  def change
    create_table :avisos do |t|
      t.text :descricao

      t.timestamps null: false
    end
  end
end
