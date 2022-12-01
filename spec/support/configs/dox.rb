Dir[Rails.root.join('spec/docs/**/*.rb')].sort.each { |file| require file }

Dox.configure do |config|
  config.descriptions_location = Rails.root.join('spec/docs/v1/descriptions')
  config.title = 'API'
  config.headers_whitelist = %w[Accept Authorization X-Refresh-Token]
  config.api_version = '1.0'
  config.header_description = 'header.md'
end
