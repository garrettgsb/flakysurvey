class SessionsController < ApplicationController
  def new

  end

  def create
    @selected_user = User.find_by(:username => params[:session][:username])
    if @selected_user && @selected_user.password == params[:session][:password]
      session[:current_user_id] = @selected_user.id
      @current_user = User.find(session[:current_user_id])
      flash[:notice] = "Logged in successfully as #{@current_user.username}"
    else
      flash[:alert] = "Incorrect login credentials"
    end
      redirect_to '/'
  end

  def sign_out
    session[:current_user_id] = nil
    redirect_to :new_session
  end

  def narnia
    @surveys = Survey.all
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
