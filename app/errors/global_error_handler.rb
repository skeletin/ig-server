module GlobalErrorHandler
  def self.included(clazz)
    clazz.class_eval do
      rescue_from ActiveRecord::RecordInvalid do |exception|
        render json: ResponseEntity.error(message: -> { exception.message }, errors: exception.record.errors), status: :bad_request
      end

      rescue_from InvalidCredentialsError do |exception|
        render json: ResponseEntity.error(message: -> { exception.message }, errors: ["invalid email/password"]), status: :unauthorized
      end

      rescue_from InvalidOtpError do |exception|
        render json: ResponseEntity.error(message: -> { exception.message }, errors: ["invalid passcode"]), status: :unprocessable_entity
      end

      rescue_from UnauthenticatedError do |exception|
        render json: ResponseEntity.error(message: -> { exception.message }, errors: ["Please log in"]), status: :forbidden
      end
    end
  end
end