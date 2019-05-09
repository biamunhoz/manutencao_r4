class TecnicoToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :tecnico_id, :integer
  end
end
