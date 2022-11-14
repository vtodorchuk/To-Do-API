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
        path '/projects'
        verb 'GET'
        desc 'Get all project sorted by date of publication'
      end

      document :show do
        action 'Get an project'
        path '/projects/:id'
        verb 'GET'
        desc 'Get JSON of all project model'
      end

      document :create do
        action 'Create an project'
        path '/projects'
        verb 'POST'
        desc 'Create and Get JSON of all project model'
      end

      document :destroy do
        action 'Delete an project'
        path '/projects/:id'
        verb 'DELETE'
        desc 'Delete project and Get status'
      end
    end
  end
end
