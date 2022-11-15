describe Api::V1::CommentsController, api: true, type: :controller do
  include Docs::V1::Comments::Api
  let(:user) { create(:user) }
  let(:task) { create(:task) }
  let(:comment) { create(:comment, task: task) }
  let(:comment_attributes) { attributes_for(:comment) }

  let(:access_token) do
    payload = { user_id: user.id }
    session = JWTSessions::Session.new(payload: payload)
    "Bearer #{session.login[:access]}"
  end

  describe 'GET #index' do
    context 'when success' do
      include Docs::V1::Comments::Index
      before do
        task
        request.headers[JWTSessions.access_header] = access_token
        get :index, params: { project_id: task.project.id, task_id: task.id }
      end

      it do
        expect(response).to have_http_status(:found)
      end

      it do
        expect(response).to match_response_schema('comments')
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :index, params: { project_id: task.project.id, task_id: rand(0..10) }
      end

      it do
        expect(response).to have_http_status(:not_found)
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
        expect(response).to match_response_schema('comment')
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
    end
  end

  describe 'POST #create' do
    context 'when success' do
      include Docs::V1::Comments::Create
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :create, params: { project_id: task.project.id, task_id: task.id, body: comment_attributes[:body] }
      end

      it do
        expect(response).to have_http_status(:created)
      end

      it do
        expect(response).to match_response_schema('comment')
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        get :create, params: { project_id: task.project.id,
                               task_id: task.id,
                               body: 'a' * Comment::MAX_BODY_LENGTH.next }
      end

      it do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it do
        expect(response).to match_response_schema('errors')
      end
    end
  end

  describe 'DELETE #destroy' do
    include Docs::V1::Comments::Destroy
    context 'when success' do
      before do
        comment
        request.headers[JWTSessions.access_header] = access_token
      end

      it do
        expect do
          delete :destroy, params: { project_id: task.project.id, task_id: task.id, id: comment.id }
        end.to change(Comment, :count).from(1).to(0)
      end
    end

    context 'when failure' do
      before do
        request.headers[JWTSessions.access_header] = access_token
        delete :destroy, params: { project_id: task.project.id, task_id: task.id, id: rand(0..10) }
      end

      it do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
