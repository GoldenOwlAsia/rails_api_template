class Api::V1::BaseController < ApplicationController

  include ActionController::Serialization
  include Api::V1::BaseHelper
  extend Api::ErrorHandling

  define_handle_exception_methods
  handle_as_internal_server_error Exception, error_code: Api::Error::CODES[:unknown]
  handle_as_internal_server_error ActiveRecord::RecordNotFound,
    error_code: Api::Error::CODES[:record_not_found]
  handle_as_internal_server_error Api::Error::API::Login::AuthenticationFailed,
    error_code: Api::Error::CODES[:user_not_authenticated]
  handle_as_internal_server_error CanCan::AccessDenied,
    error_code: Api::Error::CODES[:user_not_authorized]
  protect_from_forgery with: :null_session
  before_action :authenticate_from_token!

  respond_to :json

  def set_paginate
    @page = params[:page] || 1
    @per = params[:per] || 5
  end

  def current_user
    @user
  end
end
