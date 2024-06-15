class OtpMailer < ApplicationMailer
  default from: 'no-reply@test.com'
  
  def send_otp_email(email)
    mail to: email, subject: "CoverGlam One-Time Code", body: get_otp(email)
  end

  private
  def get_otp(email)
    Rails.cache.read(email) 
  end
end
