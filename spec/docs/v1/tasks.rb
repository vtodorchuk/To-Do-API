module Docs
  module V1
    module Tasks
      extend Dox::DSL::Syntax

      document :api do
        resource 'Tasks' do
          endpoint '/tasks'
          group 'Projects'
        end

        group 'Projects' do
          desc 'Projects group'
        end
      end

      document :index do
        action 'Get all tasks'
      end

      document :show do
        action 'Get a task'
      end

      document :create do
        action 'Create a task'
      end

      document :update do
        action 'Update a task'
      end

      document :destroy do
        action 'Delete a task'
      end
    end
  end
end
