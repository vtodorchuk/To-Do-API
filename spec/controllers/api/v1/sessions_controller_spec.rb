describe Api::V1::SessionsController do
  let(:user) { create(:user) }

  describe 'POST v1/users/sing_in' do
    context 'when success' do
      before do
        post :create, params: { email: user.email, password: user.password }
      end

      it 'has status success' do
        expect(response).to have_http_status(:created)
      end

      it 'has return json with tokens' do
        expect(JSON.parse(response.body)['data']['session'].keys.sort).to eq %w[access access_expires_at csrf refresh
                                                                                refresh_expires_at]
      end
    end

    context 'when unsuccessful' do
      before do
        post :create, params: { email: FFaker::Internet.email, password: 'wrong_password' }
      end

      it 'has status unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'has return empty json' do
        expect(JSON.parse(response.body)).to be_nil
      end
    end
  end

  # describe 'DELETE v1/users/sing_in' do
  #   context 'when success' do
  #     before do
  #       delete :destroy, params: { email: user.email, password: user.password }
  #     end
  #
  #     it 'has status success' do
  #       expect(response).to be_successful
  #     end
  #
  #     it 'has return json with tokens' do
  #       expect(JSON.parse(response.body)).to be_nil
  #     end
  #   end
  # end
end
