module Docs
  module V1
    module Tasks
      extend Dox::DSL::Syntax

      document :api do
        resource 'Tasks' do
          endpoint '/tasks'
          group 'Tasks'
        end

        group 'Tasks' do
          desc 'Tasks group'
        end
      end

      document :index do
        action 'Get task'
        path '/projects/:project_id/tasks'
        verb 'GET'
        desc 'Get JSON of all task model'
      end

      document :show do
        action 'Get an task'
        path '/projects/:project_id/tasks/:id'
        verb 'GET'
        desc 'Get JSON of all task model'
      end

      document :create do
        action 'Create an task'
        path '/projects/:project_id/tasks'
        verb 'POST'
        desc 'Get JSON of all task model'
      end

      document :update do
        action 'Get task'
        path '/projects/:project_id/tasks/:id'
        verb 'PUT'
        desc 'Get JSON of all task model'
      end

      document :destroy do
        action 'Delete an task'
        path '/projects/:project_id/tasks/:id'
        verb 'DELETE'
        desc 'Get JSON of all task model'
      end
    end
  end
end
