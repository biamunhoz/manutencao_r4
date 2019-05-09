class CreateInformativoObras < ActiveRecord::Migration
  def change
    create_table :informativo_obras do |t|
      t.string :local
      t.references :building, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
      t.string :andar
      t.string :laboratorio
      t.string :contratante
      t.string :ramal
      t.string :email
      t.text :descricao
      t.boolean :intervencaologica
      t.boolean :intervencaotelefonia
      t.string :nomeemp
      t.string :cnpjemp
      t.string :foneemp
      t.string :responsavelemp
      t.string :rgemp
      t.string :nomeemergencia
      t.string :foneemergencia
      t.date :previnicio
      t.date :prevtermino
      t.string :origemrecurso
      t.references :usuario , index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
