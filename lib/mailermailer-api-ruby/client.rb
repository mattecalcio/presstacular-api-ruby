module MMAPI

  #
  # Implements a few basic functions from the MailerMailer API
  #
  class Client

    def initialize(apikey)
      @mmapi_rpc_call = MMAPI::Call.new(apikey)
    end

    # Get fields needed to populate the signup form
    #
    def get_form_fields
      params = Hash.new
      response = @mmapi_rpc_call.executeMethod('getFormFields', params)
      return response
    end

    # Add the specifed subscriber
    #
    def add_subscriber(subscriber, send_invite = true, send_welcome = false)
      params = Hash.new
      params["subscriber"] = subscriber
      params["send_invite"] = send_invite
      params["send_welcome"] = send_welcome 
      response = @mmapi_rpc_call.executeMethod('addSubscriber', params)
      return response
    end

    # Unsubscribes the subscriber associated with the given email
    #
    def unsub_subscriber(subscriber_email, permanent = false)
      params = Hash.new
      params["subscriber_email"] = subscriber_email
      params["permanent"] = permanent
      response = @mmapi_rpc_call.executeMethod('unsubSubscriber', params)
      return response
    end

  end
end
