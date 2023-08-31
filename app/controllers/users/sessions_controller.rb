class Users::SessionsController < Devise::SessionsController
  # POST localhost:3001/login
  # DELETE localhost:3001/logout

  # Set the response format to JSON for this controller.
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(current_user, _opts = {})
    # Render a JSON response for successful login.
    render json: {
      status: {
        code: 200, message: 'Logged in successfully.',
        data: { user: UserSerializer.new(current_user).serializable_hash[:data][:attributes] }
      }
    }, status: :ok
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split.last,
                               Rails.application.credentials.devise_jwt_secret_key!).first
      current_user = User.find(jwt_payload['sub'])
    end

    if current_user
      # Render a JSON response for successful logout.
      render json: {
        status: 200,
        message: 'Logged out successfully.'
      }, status: :ok
    else
      # Render a JSON response when no active session is found.
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  end
end
