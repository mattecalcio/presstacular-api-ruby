module MMAPI
  
  #
  # Class needed to encapsulate a MailerMailer API error
  #
  class Error
    
    attr_accessor :error_code
    attr_accessor :error_message

    # Initialize Error
    #
    def initialize(error_code, error_message)
      @error_code = error_code
      @error_message = error_message
    end
    
    # Determine if the given object is an
    # instance of Error
    #
    def self.is_error?(api_object)
      if (api_object.instance_of?(MMAPI::Error))
        return true
      end
      return false
    end

  end
  
end