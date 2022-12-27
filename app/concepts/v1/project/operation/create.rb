class V1::Project::Operation::Create < Trailblazer::Operation
  step :find_project
  fail :project_exists, fail_fast: true
  step :initialize_project
  step :save_project

  fail :add_errors

  def find_project(_ctx, params:, **)
    project = Project.find_by(name: params[:name])

    project.nil?
  end

  def project_exists(ctx, **)
    ctx[:errors] = [I18n.t('errors.project_exist')]
  end

  def initialize_project(ctx, current_user:, params:, **)
    ctx[:project] = Project.new(name: params[:name], user_id: current_user.id)
  end

  def save_project(_ctx, project:, **)
    project.save
  end

  def add_errors(ctx, project:, **)
    ctx[:errors] = project.errors.full_messages
  end
end
