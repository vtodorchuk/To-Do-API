describe Api::V1::ProjectsController, api: true, type: :controller do
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
      end

      it 'has status', :dox do
        get :index
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'GET #show' do
    context 'when success' do
      include Docs::V1::Projects::Show
      before do
        project
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        get :show, params: { id: project.id }
        expect(response).to have_http_status(:found)
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        get :show, params: { id: rand(0..10) }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST #create' do
    context 'when success' do
      include Docs::V1::Projects::Create
      before do
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        get :create, params: { name: new_name }
        expect(response).to have_http_status(:created)
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        get :create
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'when success' do
      include Docs::V1::Projects::Update
      before do
        project
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        put :update, params: { id: project.id, name: new_name }
        expect(response).to have_http_status(:ok)
      end

      it 'update projects', :dox do
        put :update, params: { id: project.id, name: new_name }
        expect(project.reload.name).to eq(new_name)
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        put :update, params: { id: rand(0...12) }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when success' do
      include Docs::V1::Projects::Destroy
      before do
        project
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        get :destroy, params: { id: project.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        get :destroy, params: { id: rand(0..10) }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
