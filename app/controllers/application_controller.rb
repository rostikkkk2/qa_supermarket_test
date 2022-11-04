class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  # content_security_policy do |p|
  #   p.frame_ancestors :self, ' https://customer.stage-a.space/'
  # end

  after_action do |_controller|
    # Based on to allow all origin
    # https://stackoverflow.com/questions/17542511/cannot-display-my-rails-4-app-in-iframe-even-if-x-frame-options-is-allowall
    # response.headers.delete 'X-Frame-Options'

    response.headers["X-FRAME-OPTIONS"] = "ALLOWALL"
  end
  #
  # before_action do |_controller|
  #   # binding.pry
  #   # Based on to allow all origin
  #   # https://stackoverflow.com/questions/17542511/cannot-display-my-rails-4-app-in-iframe-even-if-x-frame-options-is-allowall
  #   response.headers.delete 'X-Frame-Options'
  # end
end
