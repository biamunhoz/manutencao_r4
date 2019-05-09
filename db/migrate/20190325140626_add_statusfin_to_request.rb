class AddStatusfinToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :statusfin, :string
  end
end
