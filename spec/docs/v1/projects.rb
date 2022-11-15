module Docs
  module V1
    module Projects
      extend Dox::DSL::Syntax

      document :api do
        resource 'Projects' do
          endpoint '/projects'
          group 'Projects'
        end

        group 'Projects' do
          desc 'Projects group'
        end
      end

      document :index do
        action 'Get project'
      end

      document :update do
        action 'Get project'
      end

      document :show do
        action 'Get an project'
      end

      document :create do
        action 'Create an project'
      end

      document :destroy do
        action 'Delete an project'
      end
    end
  end
end
