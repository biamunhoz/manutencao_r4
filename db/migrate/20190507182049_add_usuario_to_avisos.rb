class AddUsuarioToAvisos < ActiveRecord::Migration
  def change
    add_column :avisos, :usuario_id, :integer, index: true, foreign_key: true
  end
end
