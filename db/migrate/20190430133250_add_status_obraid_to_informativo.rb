class AddStatusObraidToInformativo < ActiveRecord::Migration
  def change
    add_column :informativo_obras, :statusobra_id, :integer, index: true, foreign_key: true
  end
end
