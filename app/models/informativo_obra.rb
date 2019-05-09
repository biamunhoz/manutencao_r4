class InformativoObra < ActiveRecord::Base

  belongs_to :department
  belongs_to :building
  belongs_to :usuario
  belongs_to :statusobra

  mount_uploader :fotoobra1, Fotoobra1Uploader
  mount_uploader :fotoobra2, Fotoobra2Uploader
  mount_uploader :fotoobra3, Fotoobra3Uploader
  mount_uploader :fotoobra4, Fotoobra4Uploader
  mount_uploader :fotoobra5, Fotoobra5Uploader

  mount_uploader :oficio1, Oficio1Uploader
  mount_uploader :oficio2, Oficio2Uploader
  mount_uploader :oficio3, Oficio3Uploader
  mount_uploader :oficio4, Oficio4Uploader
  mount_uploader :oficio5, Oficio5Uploader
  mount_uploader :oficio6, Oficio6Uploader
  mount_uploader :oficio7, Oficio7Uploader
  mount_uploader :oficio8, Oficio8Uploader
  mount_uploader :oficio9, Oficio9Uploader
  mount_uploader :oficio10, Oficio10Uploader

  mount_uploader :planta1, Planta1Uploader
  mount_uploader :planta2, Planta2Uploader
  mount_uploader :planta3, Planta3Uploader
  mount_uploader :planta4, Planta4Uploader
  mount_uploader :planta5, Planta5Uploader
  mount_uploader :planta6, Planta6Uploader
  mount_uploader :planta7, Planta7Uploader
  mount_uploader :planta8, Planta8Uploader
  mount_uploader :planta9, Planta9Uploader
  mount_uploader :planta10, Planta10Uploader

end
