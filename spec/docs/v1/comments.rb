module Docs
  module V1
    module Comments
      extend Dox::DSL::Syntax

      document :api do
        resource 'Comment' do
          endpoint '/project/:project_id/tasks/:task_id/comments'
          group 'Tasks'
        end

        group 'Tasks' do
          desc 'Tasks group'
        end
      end

      document :index do
        action 'Get comment'
        desc 'Get all comment sorted by date of publication'
      end

      document :show do
        action 'Get an comment'
        desc 'Get JSON of all comment model'
      end

      document :create do
        action 'Create an comment'
        desc 'Create and Get JSON of all comment model'
      end

      document :destroy do
        action 'Delete an comment'
        desc 'Delete comment and Get status'
      end
    end
  end
end
