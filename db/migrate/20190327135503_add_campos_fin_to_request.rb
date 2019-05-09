class AddCamposFinToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :material, :text
    add_column :requests, :verbamaterial, :string
  end
end
