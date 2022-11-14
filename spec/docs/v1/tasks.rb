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
      end

      document :show do
        action 'Get an task'
      end

      document :create do
        action 'Create an task'
      end

      document :destroy do
        action 'Delete an task'
      end
    end
  end
end
