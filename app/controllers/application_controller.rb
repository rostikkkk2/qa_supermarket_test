class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  # before_action do |_controller|
  #   # Based on to allow all origin
  #   # https://stackoverflow.com/questions/17542511/cannot-display-my-rails-4-app-in-iframe-even-if-x-frame-options-is-allowall
  #   response.headers.delete 'X-Frame-Options'
  #
  #   # response.headers["X-FRAME-OPTIONS"] = "ALLOW-FROM http://localhost:4002"
  # end
end
