describe Api::V1::TasksController, api: true, type: :controller do
  include Docs::V1::Tasks::Api
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, project: project) }

  let(:params_task) { attributes_for(:task) }
  let(:new_title) { FFaker::Lorem.word }

  let(:access_token) do
    payload = { user_id: user.id }
    session = JWTSessions::Session.new(payload: payload)
    "Bearer #{session.login[:access]}"
  end

  describe 'GET #index' do
    include Docs::V1::Tasks::Index
    context 'when success' do
      before do
        task
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        get :index, params: { project_id: project.id }
        expect(response).to have_http_status(:found)
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        get :index, params: { project_id: rand(0..10) }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET #show' do
    include Docs::V1::Tasks::Show
    context 'when success' do
      before do
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        get :show, params: { project_id: project.id, id: task.id }
        expect(response).to have_http_status(:found)
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        get :show, params: { project_id: project.id, id: rand(0...10) }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST #create' do
    include Docs::V1::Tasks::Create
    context 'when success' do
      before do
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        get :create, params: { project_id: project.id, title: new_title }
        expect(response).to have_http_status(:created)
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        get :create, params: { project_id: rand(0..10) }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    include Docs::V1::Tasks::Update
    context 'when success' do
      before do
        task
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        put :update, params: { project_id: project.id, id: task.id, title: new_title }
        expect(response).to have_http_status(:ok)
      end

      it 'update task', :dox do
        put :update, params: { project_id: project.id, id: task.id, title: new_title }
        expect(task.reload.title).to eq(new_title)
      end
    end

    context 'when failure' do
      before do
        task
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        put :update, params: { project_id: project.id, id: rand(0..10) }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'DELETE #destroy' do
    include Docs::V1::Tasks::Destroy
    context 'when success' do
      before do
        task
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'destroy task', :dox do
        expect do
          delete :destroy, params: { project_id: task.project.id, id: task.id }
        end.to change(Task, :count).from(1).to(0)
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
      end

      it 'has status', :dox do
        delete :destroy, params: { project_id: project.id, id: rand(0..10) }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
