module Docs
  module V1
    module Sessions
      extend Dox::DSL::Syntax

      document :api do
        resource 'Sessions' do
          group 'Sessions'
        end

        group 'Sessions' do
          desc 'Sessions group'
        end
      end

      action :create do
        path '/sing_in'
        verb 'POST'
        desc 'Sing in'
      end

      action :destroy do
        path '/sing_out'
        verb 'DELETE'
        desc 'Sing out'
      end
    end
  end
end
