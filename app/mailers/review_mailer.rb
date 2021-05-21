class ReviewMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.review_mailer.verifiy_email.subject
  #
  def verifiy_email
    @to_mail = params[:to_mail]
    @review = params[:review]

    mail to: @to_mail
  end
end
