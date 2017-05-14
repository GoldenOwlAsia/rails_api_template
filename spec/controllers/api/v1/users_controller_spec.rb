require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:params) { Hash(user: { email: Faker::Internet.free_email, password: '12341234' }) }

  describe 'GET #index' do
    def do_request
      get :index, auth_token: user.auth_token
    end

    describe 'return list of users' do
      before { do_request }

      it { expect_status 200 }
      it { expect_json({ success: true }) }
      it { expect_json('users.0', { email: user.email }) }
    end
  end

  describe 'GET #show' do
    def do_request
      get :show, { id: user.id, auth_token: user.auth_token }
    end

    describe 'return list of users' do
      before { do_request }

      it { expect_status 200 }
      it { expect_json({ success: true }) }
      it { expect_json('user', { email: user.email }) }
    end
  end

  describe 'POST #create' do
    def do_request
      post :create, params.merge(auth_token: user.auth_token)
    end

    describe 'return new users' do
      before { do_request }

      it { expect_status 200 }
      it { expect_json({ success: true }) }
      it { expect_json('user', { email: params[:user][:email] }) }
    end
  end

  describe 'PUT #update' do
    def do_request
      put :update, params.merge(id: user.id, auth_token: user.auth_token)
    end

    describe 'return users' do
      before { do_request }

      it { expect_status 200 }
      it { expect_json({ success: true }) }
      it { expect_json('user', { email: params[:user][:email] }) }
    end
  end

  describe 'DELETE #destroy' do
    def do_request
      delete :destroy, { id: user.id, auth_token: user.auth_token }
    end

    describe 'return list of users' do
      before { do_request }

      it { expect_status 200 }
      it { expect_json({ success: true }) }
      it { expect_json(message: 'User was successfully deleted.') }
    end
  end
end
