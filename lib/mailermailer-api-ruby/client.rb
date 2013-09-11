module MAILAPI

  #
  # Implements a few basic functions from the Mail API.
  #
  class Client

    def initialize(apikey)
      @mailapi_call = MAILAPI::Call.new(apikey)
    end

    # Ping the Mail API. This simple method will return "true"
    # if you can connect with the API, or an exception if you cannot.
    #
    def ping
      params = Hash.new
      response = @mailapi_call.executeMethod('ping', params)
      return response
    end

    # Returns the fields needed to create a list member or to create/populate a signup form.
    #
    def get_form_fields
      params = Hash.new
      response = @mailapi_call.executeMethod('getFormFields', params)
      return response
    end

    # Add the specified member record to the account email list.
    #
    def add_member(member, send_invite = true, send_welcome = false)
      params = Hash.new
      params["member"] = member
      params["send_invite"] = send_invite
      params["send_welcome"] = send_welcome 
      response = @mailapi_call.executeMethod('addMember', params)
      return response
    end

    # Unsubscribe the email address from the account email list.
    #
    def unsub_member(user_email)
      params = Hash.new
      params["user_email"] = user_email
      response = @mailapi_call.executeMethod('unsubMember', params)
      return response
    end

  end
end
