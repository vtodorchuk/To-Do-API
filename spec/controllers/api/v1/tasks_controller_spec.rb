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

      it do
        expect(response).to have_http_status(:found)
      end

      it do
        expect(JSON.parse(response.body)).to eq([{ id: task.id,
                                                   project_id: task.project.id,
                                                   title: task.title,
                                                   completed: task.completed,
                                                   deadline: task.deadline
                                                 }])
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :index, params: { project_id: rand(0..10) }
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
      include Docs::V1::Tasks::Show
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :show, params: { project_id: project.id, id: task.id }
      end

      it do
        expect(response).to have_http_status(:found)
      end

      it do
        expect(JSON.parse(response.body)).to eq({ id: task.id,
                                                                  project_id: task.project.id,
                                                                  title: task.title,
                                                                  completed: task.completed,
                                                                  deadline: task.deadline })
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

      it do
        expect(JSON.parse(response.body)).to be_nil
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

      it do
        expect(response).to have_http_status(:created)
      end

      it do
        expect(JSON.parse(response.body)['data']['task']).to eq({ id: task.id,
                                                                  project_id: task.project.id,
                                                                  title: new_title,
                                                                  completed: task.completed,
                                                                  deadline: task.deadline,
                                                                  created_at: task.created_at,
                                                                  updated_at: task.updated_at })
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :create, params: { project_id: project.id, id: rand(0..10) }
      end

      it do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it do
        expect(JSON.parse(response.body)).to eq(['Project must exist'])
      end
    end
  end

  describe 'PUT #update' do
    include Docs::V1::Tasks::Update
    context 'when success' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        put :update, params: { project_id: project.id, id: task.id, title: new_title }
      end

      it do
        expect(response).to have_http_status(:ok)
      end

      it do
        expect(JSON.parse(response.body)).to eq({ id: task.id,
                                                                  project_id: task.project.id,
                                                                  title: new_title,
                                                                  completed: task.completed,
                                                                  deadline: task.deadline })
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        put :update, params: { project_id: project.id, id: rand(0..10) }
      end

      it do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it do
        expect(JSON.parse(response.body)).to eq(["Name can't be blank"])
      end
    end
  end

  describe 'DELETE #destroy' do
    include Docs::V1::Tasks::Destroy
    context 'when success' do
      before do
        request.headers[JWTSessions.access_header] = access_token
      end

      it do
        expect do
          get :destroy, params: { project_id: task.project.id, task_id: task.id, id: comment.id }
        end.to change(Task, :count).by(-1)
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :destroy, params: { project_id: project.id, id: rand(0..10) }
      end

      it do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
