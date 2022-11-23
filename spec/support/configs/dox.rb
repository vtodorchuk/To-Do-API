Dir[Rails.root.join('spec/docs/**/*.rb')].sort.each { |file| require file }

Dox.configure do |config|
  config.descriptions_location  = Rails.root.join('spec/docs/v1/descriptions')
  config.headers_whitelist = ['Accept', 'X-Auth-Token', 'X-Refresh-Token']
  config.title = 'API'
  config.api_version = '1.0'
  config.header_description = 'header.md'
end
