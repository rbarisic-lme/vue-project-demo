# Preview all emails at http://localhost:3000/rails/mailers/review_mailer
class ReviewMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/review_mailer/verifiy_email
  def verifiy_email
    ReviewMailer.verifiy_email
  end

end
