class V1::Project::Operation::Destroy < Trailblazer::Operation
  step :find_project, fail_fast: true
  step :destroy_project

  def find_project(ctx, params:, current_user:, **)
    ctx[:project] = current_user.projects.find_by(id: params[:id])
  end

  def destroy_project(_ctx, project:, **)
    project.destroy
  end
end
