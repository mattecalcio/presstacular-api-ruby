require 'presstacular-api-ruby'

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

member = Hash.new

# Open text fields
member['user_email'] = ENV['MAILAPI_TEST_EMAIL'];
member['user_fname'] = 'John';
member['user_lname'] = 'Doe';

# Country
member['user_country'] = 'us';

# State
member['user_state'] = 'md';

# Category fields with multiple selection (checkboxes)
member['user_attr1'] = ['a','b','c','d'];

# Category fields with single selection (dropdown menu)
member['user_attr2'] = ['a'];

# Create our API object
mailapi = MAILAPI::Client.new(ENV['MAILAPI_KEY'])

# Evaluate response
response = mailapi.add_member(member)

if (MAILAPI::Error::is_error?(response))
  puts "Error"
  puts "Code: #{response.error_code}"
  puts "Message: #{response.error_message}"
else
  puts "Success added member"
end
