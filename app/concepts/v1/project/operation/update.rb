class V1::Project::Operation::Update < Trailblazer::Operation
  step :find_project
  fail :not_found, fail_fast: true
  step :update_project
  fail :add_errors

  def find_project(ctx, params:, current_user:, **)
    ctx[:project] = Project.find_by(id: params[:id], user_id: current_user.id)
  end

  def not_found(ctx, **)
    ctx[:errors] = [I18n.t('errors.not_found')]
  end

  def update_project(_ctx, params:, project:, **)
    project.update(name: params[:name])
  end

  def add_errors(ctx, project:, **)
    ctx[:errors] = project.errors.full_messages
  end
end
