class Comentario < ActiveRecord::Base

  belongs_to :request
  belongs_to :usuario

end
