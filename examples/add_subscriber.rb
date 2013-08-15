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

subscriber = Hash.new

# Open text fields
subscriber['user_email'] = ENV['MAILAPI_TEST_EMAIL'];
subscriber['user_fname'] = 'John';
subscriber['user_lname'] = 'Doe';

# Country
subscriber['user_country'] = 'us';

# State
subscriber['user_state'] = 'md';

# Category fields with multiple selection (checkboxes)
subscriber['user_attr1'] = ['a','b','c','d'];

# Category fields with single selection (dropdown menu)
subscriber['user_attr2'] = ['a'];

# Create our API object
mailapi = MAILAPI::Client.new(ENV['MAILAPI_KEY'])

# Evaluate response
response = mailapi.add_subscriber(subscriber)

if (MAILAPI::Error::is_error?(response))
  puts "Error"
  puts "Code: #{response.error_code}"
  puts "Message: #{response.error_message}"
else
  puts "Success added subscriber"
end
