class ResponsesController < ApplicationController
  before_action :yo_you_should_log_in
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
  end

  def index
    set_index
  end

  def sign_out
    session[:current_user_id] = nil
    redirect_to :new_session
  end

  def show
    @response = params[:id]
  end

  private

  def response_params
    params.require(:response).permit! #TODO: Strong params
  end

  private

  def yo_you_should_log_in
   redirect_to '/sign_in' unless @current_user
  end

  def set_index
    @this_user = User.find(params[:user_id])
    @responses = @this_user.responses.all
    @my_index = @current_user.id == @this_user.id
  end

  def set_response
    # Set response stuff
    @response = Response.find(params[:id])
    @answers = @response.answers.all

    # Set survey stuff
    @survey = @response.survey
    @questions = @survey.questions.all

    # Set user stuff
    @this_user = User.find(params[:user_id])
    @my_response = @current_user.id == @response.user.id
  end

end
