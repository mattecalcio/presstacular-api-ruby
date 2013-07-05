# MailerMailer API

mailermailer-ruby-api is a Ruby based API wrapper for the MailerMailer XML-RPC API.

## Installation

Add this line to your application's Gemfile:

    gem 'mailermailer-ruby-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mailermailer-ruby-api

## Usage

Create a Client instance:

    mmapi = MMAPI::Client.new('api key')
  
Start making calls

    response = mmapi.get_form_fields()

Handle the response appropriately

    if (MMAPI::Error::is_error?(response))
      puts "Error"
      puts "Message: #{response.get_error_message}"
      puts "Code: #{response.get_error_code}"
    else
      puts "Success"
      response.each{ |field|
        puts "-"
        puts "Fieldname: " + field["fieldname"]
        puts "Description " + field["description"]
        puts "Type: " + field["type"]
      }
    end

Checking the success or failure of any call can be easily done by invoking `MMAPI::Error::is_error?` on the response.
If the call encountered an error then the response will be of type Error and `is_error?` will return true, otherwise the call succeeded.
Every error will have an associated error code and message which can be retrieved through the Error class accessors as seen in the example above.

For the official documentation of the MailerMailer XML-RPC API please visit [here](http://www.mailermailer.com/api/index.rwp).

