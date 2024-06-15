module OtpSender
    extend ActiveSupport::Concern

    included do 
        after_action :send_otp, only: [:send_otp_email]
    end

    private 

    def send_otp
        OtpMailer.send_otp_email(user_params[:email]).deliver_later
    end
end