class AuthenticationController < ApplicationController
    # The authentication controller should expose an /auth/login 
    # endpoint that accepts user credentials and 
    # returns a JSON response with the result.

    skip_before_action :authorize_request, only: :authenticate
    
    # return auth token once user is authenticated
    def authenticate
      auth_token =
        AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
      if auth_token
        response = { auth_token: auth_token }
        json_response(response)
      end 
       
    end
  
    private
  
    def auth_params
      params.permit(:email, :password)
    end
  end