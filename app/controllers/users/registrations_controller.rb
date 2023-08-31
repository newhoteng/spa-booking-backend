class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # POST localhost:3001/signup
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(current_user, _opts = {})
    # Render success message and user data if registration was successful.
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up successfully.' },
        data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      }
    else
      # Render error message if registration failed.
      render json: {
        status: { message: "Registration failed. #{current_user.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email])
  end
end
