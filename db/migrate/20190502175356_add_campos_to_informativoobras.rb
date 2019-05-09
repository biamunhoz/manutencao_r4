class AddCamposToInformativoobras < ActiveRecord::Migration
  def change
    add_column :informativo_obras, :justificativa, :text
    add_column :informativo_obras, :dataconclusao, :date
  end
end
