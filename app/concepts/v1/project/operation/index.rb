class V1::Project::Operation::Index < Trailblazer::Operation
  step :get_all_project

  def get_all_project(ctx, current_user:, **)
    ctx[:projects] = current_user.projects
  end
end
