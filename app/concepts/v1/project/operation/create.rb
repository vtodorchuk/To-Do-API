class V1::Project::Operation::Create < Trailblazer::Operation
  step :initialize_project
  step :save_project
  fail :add_errors

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
