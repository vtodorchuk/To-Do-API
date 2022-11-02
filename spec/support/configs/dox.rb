Dox.configure do |config|
  config.descriptions_location = Rails.root.join('spec/docs/v1/descriptions')
  config.schema_request_folder_path = Rails.root.join('spec/docs/v1/schemas')
  config.schema_response_folder_path = Rails.root.join('spec/support/v1/schemas')
  config.schema_response_fail_file_path = Rails.root.join('spec/support/v1/schemas/error.json')
  config.headers_whitelist = %w[Accept X-Auth-Token]
  config.title = 'API'
  config.api_version = '1.0'
  config.header_description = 'api_description.md'
end
