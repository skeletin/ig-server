class EmailAlreadyExistError < StandardError
  def initialize(email)
    super("User already exist with email: #{email}")
  end
end