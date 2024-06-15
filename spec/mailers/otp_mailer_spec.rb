require "rails_helper"

RSpec.describe OtpMailer, type: :mailer do
  describe "send_otp_email" do
    let(:mail) { OtpMailer.send_otp_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Send otp email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
