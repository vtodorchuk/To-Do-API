class V1::Project::Operation::Show < Trailblazer::Operation
  step :find_project

  def find_project(ctx, params:, current_user:, **)
    ctx[:project] = Project.find_by(id: params[:id], user_id: current_user.id)
  end
end
