class V1::Project::Operation::Index < Trailblazer::Operation
  step Policy::Pundit(ProjectPolicy, :index?)
  fail :fail_policy, fail_fast: true
  step :get_all_project

  def fail_policy(ctx, **)
    ctx[:errors] = ['Unauthorized']
    ctx[:status] = :unauthorized
  end

  def get_all_project(ctx, current_user:, params:, **)
    ctx[:models] = current_user.projects.page(params[:page])
  end
end
