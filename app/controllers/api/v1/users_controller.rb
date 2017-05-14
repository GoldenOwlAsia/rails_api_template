class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_paginate, only: %w(index)
  def index
    @users = User.all
    total = @users.count
    render json: { success: true, users: @users.map { |x| UserSerializer.new(x, scope: current_user, scope_name: :current_user) }, paginate: { per: @per, page: @page, total: total } }
  end

  def show
    render json: { success: true, user: UserSerializer.new(@user, scope: current_user, scope_name: :current_user) }
  end
end
