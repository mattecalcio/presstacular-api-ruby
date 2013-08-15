module MAILAPI
  
  #
  # Class that helps to connect to the Mail API.
  #
  class Call
    API_URL = (ENV["MAILAPI_URL"] ? ENV["MAILAPI_URL"] : MAILAPI::ENDPOINT)
    API_VERSION = 'v1.0.2'

    # Point our client to the API end point.
    #
    def initialize(apikey)
      @apikey = apikey
      @server = XMLRPC::Client.new2(API_URL)
      @server.http_header_extra = { "User-Agent" => "#{MAILAPI::PARTNER}/Ruby/#{MAILAPI::VERSION}" }
    end
    
    # Call desired function with the given parameters.
    # In case of an error return error message.
    #
    def executeMethod(method, params)
      # Add the apikey
      params.merge!({:apikey => @apikey})
      begin
        response = @server.call(method,params)
        return response
      rescue XMLRPC::FaultException => e
        return MAILAPI::Error.new(e.faultCode, e.faultString)
      end
    end

  end

end
