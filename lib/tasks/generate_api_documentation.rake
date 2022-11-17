# lib/tasks/generate_api_documentation.rake
require 'rspec/core/rake_task'

namespace :api do
  namespace :v1 do
    desc 'Generate API v1 documentation'

    md_file = 'spec/docs/v1/md/docs.md'
    html_file = 'public/docs/v1.html'

    task md: :environment do
      RSpec::Core::RakeTask.new(:api_spec) do |t|
        t.rspec_opts = "-f Dox::Formatter --order defined --tag dox --out #{md_file}"
      end

      Rake::Task['api_spec'].invoke
    end

    task html: :environment do
      system("aglio -i #{md_file} -o #{html_file}")
    end

    task docs: ['api:v1:md', 'api:v1:html']
  end
end
