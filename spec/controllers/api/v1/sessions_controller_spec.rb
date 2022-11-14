describe Api::V1::SessionsController, type: :controller do
  include Docs::V1::Sessions::Api
  let(:user) { create(:user) }

  describe 'POST create' do
    context 'when success' do
      include Docs::V1::Sessions::Create
      before do
        post :create, params: { email: user.email, password: user.password }
      end

      it 'has status success' do
        expect(response).to have_http_status(:created)
      end

      it 'has return json with tokens' do
        expect(JSON.parse(response.body)['session'].keys.sort).to eq %w[access access_expires_at csrf refresh
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

  describe 'DELETE destroy' do
    context 'when success' do
      include Docs::V1::Sessions::Destroy
      before do
        payload = { user_id: user.id }
        session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
        tokens = session.login
        request.headers[JWTSessions.access_header] = "Bearer #{tokens[:access]}"
        request.headers[JWTSessions.csrf_header] = tokens[:csrf]
        delete :destroy
      end

      it 'has status success' do
        expect(response).to have_http_status(:ok)
      end

      it 'has return json with tokens' do
        expect(response.body).to eq(' ')
      end
    end
  end
end
