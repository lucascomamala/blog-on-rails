class Api::V1::ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  respond_to :json
end
