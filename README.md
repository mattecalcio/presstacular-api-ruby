# mailermailer-api-ruby

mailermailer-api-ruby is a Ruby based API wrapper for the MailerMailer XML-RPC API.

## Requirements

Ruby 1.9.3

## Installation

Add this line to your application's Gemfile:

    gem 'mailermailer-api-ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mailermailer-api-ruby

## Usage

Create a Client instance:

    mailapi = MAILAPI::Client.new('api key')
  
Start making calls

    response = mailapi.get_form_fields()

Handle the response appropriately

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

Checking the success or failure of any call can be easily done by invoking `MAILAPI::Error::is_error?` on the response.
If the call encountered an error then the response will be of type Error and `is_error?` will return true, otherwise the call succeeded.
Every error will have an associated error code and message which can be retrieved through the Error class accessors as seen in the example above.

For the official documentation of the MailerMailer XML-RPC API please visit [here](http://www.mailermailer.com/api/index.rwp).

## Examples

We have provided examples for each call available in the API in the examples folder. In order
to run the examples make sure you have the following environmental variables set:

    MAILAPI_KEY = 'your api key will go here'
    MAILAPI_TEST_EMAIL = 'the email address that you would like to use will go here'

## Troubleshooting

If you encounter SSL problems while using the gem, and if you specifically see
this error message:

    connect': SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: 
    certificate verify failed (OpenSSL::SSL::SSLError)

it is an indication that your environment variables are incorrect, but if that isn't the case
feel free to refer to this helpful [guide](http://railsapps.github.io/openssl-certificate-verify-failed.html) for assistance.
