class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler
    include ActionController::ImplicitRender
    include ActionController::MimeResponds

    def cors_preflight_check
      headers['Access-Control-Max-Age'] = '1728000'

      render json: {} # Render as you need
    end
  
    # called before every action on controllers
    before_action :authorize_request
    attr_reader :current_user
  
    private
  
    # Check for valid request token and return user
    def authorize_request
      @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    end
  end