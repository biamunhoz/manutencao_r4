class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :subject
      t.string :request_local
      t.text :problem_description
      t.integer :usuario_id
      t.timestamps null: false
    end
  end
end
