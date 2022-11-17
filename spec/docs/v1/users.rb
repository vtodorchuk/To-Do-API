module Docs
  module V1
    module Users
      extend Dox::DSL::Syntax

      document :api do
        resource 'Users' do
          group 'Users'
        end

        group 'Users' do
          desc 'Users group'
        end
      end

      document :create do
        action 'Get User'
      end
    end
  end
end
