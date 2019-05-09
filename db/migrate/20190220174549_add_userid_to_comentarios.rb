class AddUseridToComentarios < ActiveRecord::Migration
  def change
    add_column :comentarios, :usuario_id, :integer, index: true, foreign_key: true
  end
end
