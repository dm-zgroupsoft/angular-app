class ApplicationController < ActionController::Base
  rescue_from StandardError, :with => :error_handler

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
  end

  private
  def error_handler(error)
    render :json => {success: false, errors: [error.message]}
  end
end
