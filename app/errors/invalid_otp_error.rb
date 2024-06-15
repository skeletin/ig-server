class InvalidOtpError < StandardError
    def message
        "Invalid passcode"
    end
end