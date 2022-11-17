Dir[Rails.root.join('spec/docs/**/*.rb')].sort.each { |file| require file }

Dox.configure do |config|
  config.header_file_path = Rails.root.join('spec/docs/v1/descriptions/header.md')
  config.descriptions_location = Rails.root.join('spec/docs/v1/descriptions')
  config.headers_whitelist = %w[Accept X-Auth-Token X-Refresh-Token X-Csrf-Token]
  config.title = 'API'
  config.api_version = '1.0'
end
