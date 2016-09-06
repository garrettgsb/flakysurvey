class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_current_user

  private

  def get_current_user
    if session[:current_user_id]
      @current_user = User.find(session[:current_user_id])
    end
  end
end
