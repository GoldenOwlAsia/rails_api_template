class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_paginate, only: %w(index)
  def index
    @users = User.all
    total = @users.count
    render json: { success: true, users: @users.map { |x| UserSerializer.new(x, scope: current_user, scope_name: :current_user) }, paginate: { per: @per, page: @page, total: total } }
  end

  def show
    @user = User.find(params[:id])
    render json: { success: true, user: UserSerializer.new(@user, scope: current_user, scope_name: :current_user) }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { success: true, user: UserSerializer.new(@user, scope: current_user, scope_name: :current_user) }
    else
      raise Api::Error::API::Base::CreateFailed, @user.errors.full_messages.to_sentence
    end
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      render json: { success: true, user: UserSerializer.new(@user, scope: current_user, scope_name: :current_user) }
    else
      raise Api::Error::API::Base::UpdateFailed, @user.errors.full_messages.to_sentence
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: { success: true, message: "#{User.model_name.human} was successfully deleted." }
    else
      raise Api::Error::API::Base::DeleteFailed, user.errors.full_messages.to_sentence
    end
  end

  private

  def user_params
    params.require(:user)
      .permit(:email, :password)
  end
end
