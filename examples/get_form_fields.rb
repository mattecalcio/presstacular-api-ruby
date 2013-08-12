require 'mailermailer-api-ruby'

# Make sure we have an api key
if ENV['MAILAPI_KEY'] == nil
  puts 'Set ENV["MAILAPI_KEY"] to use this example'
  exit
end

# Create our API object
mailapi = MAILAPI::Client.new(ENV['MAILAPI_KEY'])

# Get form fields
response = mailapi.get_form_fields()

# Evaluate response
if (MAILAPI::Error::is_error?(response))
  puts "Error"
  puts "Code: #{response.error_code}"
  puts "Message: #{response.error_message}"
else
  puts "Success\n"

  response.each{ |field|
    puts "-"
    puts "Fieldname: " + field["fieldname"]
    puts "Description " + field["description"]
    puts "Type: " + field["type"]
  }
end
