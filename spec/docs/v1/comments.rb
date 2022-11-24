module Docs
  module V1
    module Comments
      extend Dox::DSL::Syntax

      document :api do
        resource 'Comment' do
          endpoint '/comments'
          group 'Projects'
        end

        group 'Projects' do
          desc 'Projects group'
        end
      end

      document :index do
        action 'Get all comments for task'
      end

      document :show do
        action 'Get an comment'
      end

      document :create do
        action 'Create an comment'
      end

      document :destroy do
        action 'Delete an comment'
      end
    end
  end
end
