class StaticController < ApplicationController
    def index
        render json: {
            status: "it's working!"
        }
    end