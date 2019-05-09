class AddBuildingIdToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :building_id, :integer
  end
end
