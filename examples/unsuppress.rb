require 'mailermailer-api-ruby'

# Make sure we have an api key
if ENV['MAILAPI_KEY'] == nil
  puts 'Set ENV["MAILAPI_KEY"] to use this example'
  exit
end

# Make sure we have an email address
if ENV['MAILAPI_TEST_EMAIL'] == nil
  puts 'Set ENV["MAILAPI_TEST_EMAIL"] to use this example'
  exit
end

# Create our API object
mailapi = MAILAPI::Client.new(ENV['MAILAPI_KEY'])

# Unsuppress user
response = mailapi.unsuppress(ENV['MAILAPI_TEST_EMAIL'])

# Evaluate response
if (MAILAPI::Error::is_error?(response))
  puts "Error"
  puts "Code: #{response.error_code}"
  puts "Message: #{response.error_message}"d
else
  puts "Success\n"
end