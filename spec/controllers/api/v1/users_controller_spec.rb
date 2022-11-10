describe Api::V1::UsersController do
  let(:user) { create(:user) }

  describe 'POST v1/users/sing_up' do
    context 'when success' do
      before do
        post :create, params: { email: FFaker::Internet.email,
                                password: 'password',
                                password_confirmation: 'password' }
      end

      it 'has status success' do
        expect(response).to have_http_status(:created)
      end

      it 'has return json with tokens' do
        expect(JSON.parse(response.body)['data']['user'].keys).to eq %w[access csrf]
      end
    end
  end
end
