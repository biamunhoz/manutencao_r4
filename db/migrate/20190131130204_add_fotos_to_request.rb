class AddFotosToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :foto1, :string
    add_column :requests, :foto2, :string
    add_column :requests, :foto3, :string
  end
end
