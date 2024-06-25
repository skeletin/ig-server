class OtpMailer < ApplicationMailer
  default from: 'no-reply@test.com'
  
  def send_otp_email(email)
    mail to: email, subject: "IG Clone One-Time Code", body: get_otp(email)
  end

  private
  def get_otp(email)
    CacheService.read(email)
    # Rails.cache.read(email)
  end
end
