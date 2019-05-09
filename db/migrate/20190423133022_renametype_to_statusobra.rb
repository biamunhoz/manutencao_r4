class RenametypeToStatusobra < ActiveRecord::Migration
  def change
    rename_column :statusobras, :type, :statusobra_type
  end
end
