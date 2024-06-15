# Preview all emails at http://localhost:3000/rails/mailers/otp_mailer
class OtpMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/otp_mailer/send_otp_email
  def send_otp_email
    OtpMailer.send_otp_email
  end

end
