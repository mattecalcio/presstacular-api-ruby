require 'mailermailer-api-ruby'

# Create our API object
mmapi = MMAPI::Client.new('861d353cdf5cacc06d91d4e7136450e4')

# Get form fields
response = mmapi.ping()

# Evaluate response
if (MMAPI::Error::is_error?(response))
  puts "Error"
  puts "Code: #{response.error_code}"
  puts "Message: #{response.error_message}"
else
  puts "Success\n"
end
