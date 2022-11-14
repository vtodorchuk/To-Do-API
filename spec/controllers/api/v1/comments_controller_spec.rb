describe Api::V1::CommentsController, api: true, type: :controller do
  include Docs::V1::Comments::Api
  let(:user) { create(:user) }
  let(:task) { create(:task) }
  let(:comment) { create(:comment, task: task) }

  let(:new_body) { FFaker::Lorem.word }

  let(:access_token) do
    payload = { user_id: user.id }
    session = JWTSessions::Session.new(payload: payload)
    "Bearer #{session.login[:access]}"
  end

  describe 'GET #index' do
    context 'when success' do
      include Docs::V1::Comments::Index
      before do
        comment
        request.headers[JWTSessions.access_header] = access_token
        get :index, params: { project_id: task.project.id }
      end

      it do
        expect(response).to have_http_status(:found)
      end

      it do
        expect(JSON.parse(response.body)['data']['comments']).to eq([{ id: comment.id,
                                                                       task_id: comment.task.id,
                                                                       body: comment.title,
                                                                       created_at: comment.created_at,
                                                                       updated_at: comment.updated_at }])
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :index, params: { project_id: rand(0...10) }
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
      include Docs::V1::Comments::Show
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :show, params: { project_id: task.project.id, task_id: task.id, id: comment.id }
      end

      it do
        expect(response).to have_http_status(:found)
      end

      it do
        expect(JSON.parse(response.body)['data']['comment']).to eq({ id: comment.id,
                                                                     task_id: comment.task.id,
                                                                     body: comment.title,
                                                                     created_at: comment.created_at,
                                                                     updated_at: comment.updated_at })
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :show, params: { project_id: task.project.id, task_id: task.id, id: rand(0...10) }
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
      include Docs::V1::Comments::Create
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :create, params: { project_id: task.project.id, task_id: task.id, body: new_body }
      end

      it do
        expect(response).to have_http_status(:created)
      end

      it do
        expect(JSON.parse(response.body)['data']['comment']).to eq({ id: comment.id,
                                                                     task_id: comment.task.id,
                                                                     body: new_body,
                                                                     created_at: comment.created_at,
                                                                     updated_at: comment.updated_at })
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :create, params: { project_id: task.project.id }
      end

      it do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it do
        expect(JSON.parse(response.body)['data']['errors']).to eq(['Task must exist'])
      end
    end
  end

  describe 'PUT #update' do
    context 'when success' do
      include Docs::V1::Comments::Update
      before do
        request.headers[JWTSessions.access_header] = access_token
        put :update, params: { project_id: task.project.id, task_id: task.id, id: comment.id, body: new_body }
      end

      it do
        expect(response).to have_http_status(:ok)
      end

      it do
        expect(JSON.parse(response.body)['data']['comment']).to eq({ id: comment.id,
                                                                     task_id: comment.task.id,
                                                                     body: new_body,
                                                                     created_at: comment.created_at,
                                                                     updated_at: comment.updated_at })
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        put :update, params: { project_id: task.project.id, task_id: task.id, id: comment.id }
      end

      it do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it do
        expect(JSON.parse(response.body)['data']['errors']).to eq(["Body can't be blank"])
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when success' do
      include Docs::V1::Comments::Destroy
      before do
        request.headers[JWTSessions.access_header] = access_token
      end

      it do
        expect do
          get :destroy, params: { project_id: task.project.id, task_id: task.id, id: comment.id }
        end.to change(Comment, :count).by(-1)
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :destroy, params: { project_id: task.project.id, task_id: task.id, id: rand(0...10) }
      end

      it do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
