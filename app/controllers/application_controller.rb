require "application_responder"

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  self.responder = ApplicationResponder
  respond_to :html

  def new_session_path(scope)
    new_user_session_path
  end

  rescue_from Exception do |exception|
    begin
      redirect_to :back, :alert => exception.message
    rescue Exception => e
      redirect_to root_url, :alert => exception.message
    end
  end
end
