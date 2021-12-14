class AuthenticationController < ApplicationController
    # The authentication controller should expose an /auth/login 
    # endpoint that accepts user credentials and 
    # returns a JSON response with the result.

    skip_before_action :authorize_request, only: :authenticate
    
    # return auth token once user is authenticated
    def authenticate
      auth_token =
        AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
      user = User.find_by(email: auth_params[:email])
      response = { auth_token: auth_token, user: user }
      # json_response(response)
      render json: {
        status: :created,
        data: response
      }
    end
  
    private
  
    def auth_params
      params.permit(:email, :password)
    end
  end