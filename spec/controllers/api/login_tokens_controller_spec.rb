require 'rails_helper'

describe API::LoginTokensController do
  describe 'create' do
    let(:user) { create :user }

    it 'creates a new login token' do
      expect { post :create, email: user.email }.to change { user.login_tokens.count }.by(1)
      expect(response.status).to eq 200
    end

    it 'does not create a login token if no email is present' do
      expect { post :create }.to_not change { user.login_tokens.count }
      expect(response.status).to eq 400
    end

    it 'does not create a login token for an email we dont have' do
      expect { post :create, email: "notathing@example.com" }.to_not change { LoginToken.count }
      expect(response.status).to eq 200
    end
  end
end
