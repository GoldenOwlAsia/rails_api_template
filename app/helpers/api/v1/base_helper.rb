module Api::V1::BaseHelper
  def authenticate_from_token!
    auth_token = params[:auth_token].presence || ActionController::HttpAuthentication::Token.token_and_options(request)&.first
    resource = User.find_by(auth_token: auth_token)
    if auth_token && resource && resource.active?
      instance_variable_set("@user", resource)
    elsif auth_token && resource && !resource.active?
      raise Api::Error::API::User::Deleted, "Your account has been disabled"
    else
      raise Api::Error::API::Login::AuthenticationFailed, "You're not authenticated!"
    end
  end
end
