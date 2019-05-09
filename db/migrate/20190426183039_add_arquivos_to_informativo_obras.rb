class AddArquivosToInformativoObras < ActiveRecord::Migration
  def change
    add_column :informativo_obras, :fotoobra1, :string
    add_column :informativo_obras, :fotoobra2, :string
    add_column :informativo_obras, :fotoobra3, :string
    add_column :informativo_obras, :fotoobra4, :string
    add_column :informativo_obras, :fotoobra5, :string

    add_column :informativo_obras, :oficio1, :string
    add_column :informativo_obras, :oficio2, :string
    add_column :informativo_obras, :oficio3, :string
    add_column :informativo_obras, :oficio4, :string
    add_column :informativo_obras, :oficio5, :string
    add_column :informativo_obras, :oficio6, :string
    add_column :informativo_obras, :oficio7, :string
    add_column :informativo_obras, :oficio8, :string
    add_column :informativo_obras, :oficio9, :string
    add_column :informativo_obras, :oficio10, :string

    add_column :informativo_obras, :planta1, :string
    add_column :informativo_obras, :planta2, :string
    add_column :informativo_obras, :planta3, :string
    add_column :informativo_obras, :planta4, :string
    add_column :informativo_obras, :planta5, :string
    add_column :informativo_obras, :planta6, :string
    add_column :informativo_obras, :planta7, :string
    add_column :informativo_obras, :planta8, :string
    add_column :informativo_obras, :planta9, :string
    add_column :informativo_obras, :planta10, :string
  end
end
