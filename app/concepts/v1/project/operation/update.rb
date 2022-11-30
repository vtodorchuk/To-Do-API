class V1::Project::Operation::Update < Trailblazer::Operation
  step :find_project,
       Output(Trailblazer::Activity::Left, :failure) => Path(end_id: 'End.failure', end_task: End(:with_failure)) do
    step :not_found
  end
  step :update_project
  fail :add_errors

  def find_project(ctx, params:, current_user:, **)
    ctx[:project] = Project.find_by(id: params[:id], user_id: current_user.id)
  end

  def update_project(_ctx, params:, project:, **)
    project.update(name: params[:name])
  end

  def add_errors(ctx, project:, **)
    ctx[:errors] = project.errors.full_messages
  end

  def not_found(ctx, **)
    ctx[:errors] = 'Not Found'
  end
end
