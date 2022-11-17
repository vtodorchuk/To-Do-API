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
        action 'Get projects'
      end

      document :update do
        action 'Get projects'
      end

      document :show do
        action 'Get an projects'
      end

      document :create do
        action 'Create an projects'
      end

      document :destroy do
        action 'Delete an projects'
      end
    end
  end
end
