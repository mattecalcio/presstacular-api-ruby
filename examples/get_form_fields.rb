require 'mailermailer-api-ruby'

# Make sure we have an api key
if ENV['MMAPI_KEY'] == nil
  puts 'Set ENV["MMAPI_KEY"] to use this example'
  exit
end

# Create our API object
mmapi = MMAPI::Client.new(ENV['MMAPI_KEY'])

# Get form fields
response = mmapi.get_form_fields()

# Evaluate response
if (MMAPI::Error::is_error?(response))
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
