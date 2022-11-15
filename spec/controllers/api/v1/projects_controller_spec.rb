describe Api::V1::ProjectsController do
  include Docs::V1::Projects::Api
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
      include Docs::V1::Projects::Index
      before do
        project
        request.headers[JWTSessions.access_header] = access_token
        get :index
      end

      it 'has status', :dox do
        expect(response).to have_http_status(:found)
      end

      it 'get projects', :dox do
        expect(response).to match_response_schema('projects')
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
        expect(JSON.parse(response.body)).to be_empty
      end
    end
  end

  describe 'GET #show' do
    context 'when success' do
      include Docs::V1::Projects::Show
      before do
        project
        request.headers[JWTSessions.access_header] = access_token
        get :show, params: { id: project.id }
      end

      it 'has status', :dox do
        expect(response).to have_http_status(:found)
      end

      it 'show project', :dox do
        expect(response).to match_response_schema('project')
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
    end
  end

  describe 'POST #create' do
    context 'when success' do
      include Docs::V1::Projects::Create
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :create, params: { name: new_name }
      end

      it 'has status', :dox do
        expect(response).to have_http_status(:created)
      end

      it 'add project', :dox do
        expect(response).to match_response_schema('project')
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
        expect(response).to match_response_schema('errors')
      end
    end
  end

  describe 'PUT #update' do
    context 'when success' do
      include Docs::V1::Projects::Update
      before do
        project
        request.headers[JWTSessions.access_header] = access_token
        put :update, params: { id: project.id, name: new_name }
      end

      it 'has status', :dox do
        expect(response).to have_http_status(:ok)
      end

      it 'update project', :dox do
        expect(response).to match_response_schema('project')
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        put :update, params: { id: rand(0...12) }
      end

      it do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when success' do
      include Docs::V1::Projects::Destroy
      before do
        project
        request.headers[JWTSessions.access_header] = access_token
        get :destroy, params: { id: project.id }
      end

      it 'has status', :dox do
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
