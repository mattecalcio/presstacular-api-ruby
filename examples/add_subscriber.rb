require 'mailermailer-api-ruby'

# Create our API object
mmapi = MMAPI::Client.new('api key')

subscriber = Hash.new

# Open text fields
subscriber['user_email'] = 'johndoe@example.com';
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

# Evaluate response
response = mmapi.add_subscriber(subscriber)

if (MMAPI::Error::is_error?(response))
  puts "Error"
  puts "Code: #{response.error_code}"
  puts "Message: #{response.error_message}"
else
  puts "Success added subscriber"
end
