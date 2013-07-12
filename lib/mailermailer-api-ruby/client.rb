module MMAPI

  #
  # Implements a few basic functions from the MailerMailer API.
  #
  class Client

    def initialize(apikey)
      @mmapi_call = MMAPI::Call.new(apikey)
    end

    # Ping the MailerMailer API. This simple method will return "true"
    # if you can connect with the API, or an exception if you cannot.
    #
    def ping
      params = Hash.new
      response = @mmapi_call.executeMethod('ping', params)
      return response
    end

    # Returns the fields needed to populate an add subscriber form.
    #
    def get_form_fields
      params = Hash.new
      response = @mmapi_call.executeMethod('getFormFields', params)
      return response
    end

    # Add the specified subscriber record to the account email list.
    #
    def add_subscriber(subscriber, send_invite = true, send_welcome = false)
      params = Hash.new
      params["subscriber"] = subscriber
      params["send_invite"] = send_invite
      params["send_welcome"] = send_welcome 
      response = @mmapi_call.executeMethod('addSubscriber', params)
      return response
    end

    # Unsubscribe the subscriber email address from the account email list.
    #
    def unsub_subscriber(subscriber_email)
      params = Hash.new
      params["subscriber_email"] = subscriber_email
      response = @mmapi_call.executeMethod('unsubSubscriber', params)
      return response
    end

  end
end
