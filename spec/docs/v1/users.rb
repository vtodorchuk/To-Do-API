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

      action :create do
        path '/sing_up'
        verb 'POST'
        desc 'Sing up'
      end
    end
  end
end

