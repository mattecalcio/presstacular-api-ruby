require 'mailermailer-api-ruby'

# Create our API object
mmapi = MMAPI::Client.new('api key')

# Unsubscribe user
response = mmapi.unsub_subscriber('email to unsubscribe')

# Evaluate response
if (MMAPI::Error::is_error?(response))
  puts "Error"
  puts "Code: #{response.error_code}"
  puts "Message: #{response.error_message}"
else
  puts "Success\n"
end
