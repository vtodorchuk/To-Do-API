module Docs
  module V1
    module Refresh
      extend Dox::DSL::Syntax

      document :api do
        resource 'Refresh' do
          group 'Users'
        end

        group 'Users' do
          desc 'Users group'
        end
      end

      document :create do
        action 'Refresh session'
      end
    end
  end
end
