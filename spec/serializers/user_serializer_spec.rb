require 'rails_helper'

describe UserSerializer do
  let(:user) { FactoryGirl.create(:user) }
  let(:serializer) { UserSerializer.new(user, scope: user, scope_name: :current_user) }
  let(:serialized_attrs) { %w(email auth_token created_at updated_at) }

  describe 'return list of users serializer' do
    let(:output) { JSON.parse(serializer.to_json) }
    before { login_as(user, scope: :user) }

    it 'returns list of user' do
      expect(output).to include({ "email" => user.email, "auth_token" => user.auth_token })
    end

    it { expect(output.keys).to contain_exactly(*serialized_attrs) }
  end
end
