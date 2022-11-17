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
    context 'when success' do
      include Docs::V1::Tasks::Index
      before do
        task
        request.headers[JWTSessions.access_header] = access_token
        get :index, params: { project_id: project.id }
      end

      it 'has status', :dox do
        expect(response).to have_http_status(:found)
      end

      it 'get tasks', :dox do
        expect(response.body).to eq([{ 'id' => task.id,
                                       'project_id' => task.project_id,
                                       'title' => task.title,
                                       'completed' => task.completed,
                                       'deadline' => task.deadline,
                                       'position' => task.position }].to_json)
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :index, params: { project_id: rand(0..10) }
      end

      it do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET #show' do
    context 'when success' do
      include Docs::V1::Tasks::Show
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :show, params: { project_id: project.id, id: task.id }
      end

      it 'has status', :dox do
        expect(response).to have_http_status(:found)
      end

      it 'show task', :dox do
        expect(response.body).to eq({ 'id' => task.id,
                                      'project_id' => task.project_id,
                                      'title' => task.title,
                                      'completed' => task.completed,
                                      'deadline' => task.deadline,
                                      'position' => task.position }.to_json)
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :show, params: { project_id: project.id, id: rand(0...10) }
      end

      it do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST #create' do
    context 'when success' do
      include Docs::V1::Tasks::Create
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :create, params: { project_id: project.id, title: new_title }
      end

      it 'has status', :dox do
        expect(response).to have_http_status(:created)
      end

      it 'add task', :dox do
        expect(JSON.parse(response.body)['title']).to eq(new_title)
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :create, params: { project_id: rand(0..10) }
      end

      it do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it do
        expect(JSON.parse(response.body)['errors']).to eq(['Project must exist'])
      end
    end
  end

  describe 'PUT #update' do
    context 'when success' do
      include Docs::V1::Tasks::Update
      before do
        task
        request.headers[JWTSessions.access_header] = access_token
        put :update, params: { project_id: project.id, id: task.id, title: new_title }
      end

      it 'has status', :dox do
        expect(response).to have_http_status(:ok)
      end

      it 'update task', :dox do
        expect(JSON.parse(response.body)['title']).to eq(task.reload.title)
      end
    end

    context 'when failure' do
      before do
        task
        request.headers[JWTSessions.access_header] = access_token
        put :update, params: { project_id: project.id, id: rand(0..10) }
      end

      it do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when success' do
      include Docs::V1::Tasks::Destroy
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
        delete :destroy, params: { project_id: project.id, id: rand(0..10) }
      end

      it do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
