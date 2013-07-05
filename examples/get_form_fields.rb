require 'mailermailer-api-ruby'

# Create our API object
mmapi = MMAPI::Client.new('api key')

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
