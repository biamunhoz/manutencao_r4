class Notifier < ApplicationMailer

  def pedidoCriado(request)

    @request = request
    @assunto = "Pedido - Num.: " + @request.id.to_s + " - " + @request.subject
    mail ({
            to: @request.usuario.emailPrincipalUsuario,
            subject: @assunto,
            date: Time.now
         })
  end

  def pedidoAtualizado(request)

    @request = request
    @assunto = "Pedido - Num.: " + @request.id.to_s + " - " + @request.subject
    mail ({
             to: @request.usuario.emailPrincipalUsuario,
             subject: @assunto,
             date: Time.now
         })
  end

  def pedidoFinalizado(request)
    @request = request
    @assunto = "Pedido - Num.: " + @request.id.to_s + " - " + @request.subject
    mail ({
             to: @request.usuario.emailPrincipalUsuario,
             subject: @assunto,
             date: Time.now
         })
  end

  def avisomatdisp(request, emailtecnico)

    @request = request
    @assunto = "Pedido - Num.: " + @request.id.to_s + " - " + @request.subject
    mail ({
             to: @request.usuario.emailPrincipalUsuario,
             cc: emailtecnico,
             subject: @assunto,
             date: Time.now
         })

  end

  def informobraanalise(informativo, admin)

    @informativo = informativo

    @assunto = "Informativo de obra - Num.: " + @informativo.id.to_s + " - " + @informativo.local
    mail ({
             to: admin,
             subject: @assunto,
             date: Time.now
         })

  end

end
