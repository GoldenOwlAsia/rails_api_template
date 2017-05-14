module Tokenable
  extend ActiveSupport::Concern

  included do
    before_save :generate_token, unless: :auth_token?
  end

  protected

  def generate_token
    self.auth_token = loop do
      random_token = SecureRandom.urlsafe_base64(10, false)
      break random_token unless self.class.exists?(auth_token: random_token)
    end
  end
end
