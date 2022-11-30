module Docs
  module V1
    module Sessions
      extend Dox::DSL::Syntax

      document :api do
        resource 'Sessions' do
          group 'Users'
        end

        group 'Users' do
          desc 'Users group'
        end
      end

      document :create do
        action 'Login'
      end

      document :destroy do
        action 'Logout'
      end
    end
  end
end
