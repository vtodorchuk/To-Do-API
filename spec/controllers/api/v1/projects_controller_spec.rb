describe Api::V1::ProjectsController do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  let(:old_name) { project.name }
  let(:new_name) { FFaker::Lorem.word }

  let(:access_token) do
    payload = { user_id: user.id }
    session = JWTSessions::Session.new(payload: payload)
    "Bearer #{session.login[:access]}"
  end

  describe 'GET #index' do
    context 'when success' do
      before do
        project
        request.headers[JWTSessions.access_header] = access_token
        get :index
      end

      it do
        expect(response).to have_http_status(:found)
      end

      it do
        expect(JSON.parse(response.body)['data']['projects']).to eq([{ name: project.name,
                                                                       user_id: project.user.id,
                                                                       created_at: project.created_at,
                                                                       updated_at: project.updated_at }])
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :index
      end

      it do
        expect(response).to have_http_status(:found)
      end

      it do
        expect(JSON.parse(response.body)['data']['projects']).to be_empty
      end
    end
  end

  describe 'GET #show' do
    context 'when success' do
      before do
        project
        request.headers[JWTSessions.access_header] = access_token
        get :show, params: { id: project.id }
      end

      it do
        expect(response).to have_http_status(:found)
      end

      it do
        expect(JSON.parse(response.body)['data']['project']).to eq({ name: project.name,
                                                                     user_id: project.user.id,
                                                                     created_at: project.created_at,
                                                                     updated_at: project.updated_at })
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :show, params: { id: rand(0..10) }
      end

      it do
        expect(response).to have_http_status(:not_found)
      end

      it do
        expect(JSON.parse(response.body)).to be_nil
      end
    end
  end

  describe 'POST #create' do
    context 'when success' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :create, params: { name: new_name }
      end

      it do
        expect(response).to have_http_status(:created)
      end

      it do
        expect(JSON.parse(response.body)['data']).to eq({ user_id: project.user.id,
                                                          project_id: project.id })
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :create
      end

      it do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it do
        expect(JSON.parse(response.body)['data']['errors']).to eq(["Name can't be blank"])
      end
    end
  end

  describe 'PUT #update' do
    context 'when success' do
      before do
        project
        request.headers[JWTSessions.access_header] = access_token
        put :update, params: { id: project.id, name: new_name }
      end

      it do
        expect(response).to have_http_status(:ok)
      end

      it do
        expect(JSON.parse(response.body)['data']['project']).to eq({ name: new_name,
                                                                     user_id: project.user.id,
                                                                     created_at: project.created_at,
                                                                     updated_at: project.updated_at })
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        put :update, params: { id: project.id }
      end

      it do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it do
        expect(JSON.parse(response.body)['data']['errors']).to eq(["Name can't be blank"])
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when success' do
      before do
        project
        request.headers[JWTSessions.access_header] = access_token
        get :destroy, params: { id: project.id }
      end

      it do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :destroy, params: { id: rand(0..10) }
      end

      it do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
