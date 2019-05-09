class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :parecer
      t.belongs_to :request, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
