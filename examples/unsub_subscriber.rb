require 'mailermailer-api-ruby'

# Make sure we have an api key
if ENV['MMAPI_KEY'] == nil
  puts 'Set ENV["MMAPI_KEY"] to use this example'
  exit
end

# Make sure we have an email address
if ENV['MMAPI_TEST_EMAIL'] == nil
  puts 'Set ENV["MMAPI_TEST_EMAIL"] to use this example'
  exit
end

# Create our API object
mmapi = MMAPI::Client.new(ENV['MMAPI_KEY'])

# Unsubscribe user
response = mmapi.unsub_subscriber(ENV['MMAPI_TEST_EMAIL'])

# Evaluate response
if (MMAPI::Error::is_error?(response))
  puts "Error"
  puts "Code: #{response.error_code}"
  puts "Message: #{response.error_message}"
else
  puts "Success\n"
end
