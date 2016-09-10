class SurveysController < ApplicationController
  before_action :yo_you_should_log_in
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  before_action :get_current_user_response

  # GET /surveys
  # GET /surveys.json
  def index
    @this_user = User.find(params[:user_id])
    @surveys = Survey.where(:user_id => @this_user.id)
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @my_survey ? (render 'stats') : (render 'show')
  end

  def submit
    # Find survey based on question ID
    @this_survey = Survey.find(params[:survey])
    Response.transaction do
      Answer.transaction do
        @response = @current_user.responses.find_or_create_by(:survey_id => @this_survey.id)
        params[:questions].each do |question_id|
          case Question.find(question_id).question_type
            when "text"
              answer_text = params[:questions][question_id]["answer"]
            when "multi"
              choices = []
              params[:questions][question_id].each do |key|
                  choices << key
              end
              answer_text = choices.join(",")
            when "single"
              answer_text = params[:questions][question_id][0]
          end #case
          answer = @response.answers.find_or_create_by(:question_id => question_id)
          byebug
          answer.update(:answer => answer_text) # needs choice ID.
        end # params[:questions].each
      end # Answer.transaction
    end # Response.transaction
    redirect_to '/thanks'
  end # def submit

  def thanks
    @response = @current_user.responses.last
    @survey = @response.survey
  end

  # GET /surveys/new
  def new
    @survey = @current_user.surveys.build
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    survey_params
    questions_params
    questions = {}
    Survey.transaction do
      Question.transaction do
        # Choice.transaction do
          @survey = @current_user.surveys.create(survey_params)

          # Iterate through questions
          questions_params.each do |x|
            order = x.gsub('question-', '') # (e.g. "question-1")
            param_object = questions_params[x]
            this_question = {:order_id => order} # Later: @survey.questions.create(this_question)
            choices = [] # Later: choices.each_with_index {|x, y| @question.choices.create(:text => x, :order_id => y)}
            dummy_question = {}
            dummy_choice = {}

            # Iterate through question params
            questions_params[x].each do |y|
              # Build array to create choices
              if y == "choice"
                choice_number = 1
                questions_params[x][y].each do |choice_value|
                  choices << choice_value
                end

              # Build hash to create object
              else
                name = y # (e.g. "prompt", "label")
                value = questions_params[x][y] # (e.g. "Describe your favorite shade of blue")
                this_question[y] = value
              end
            end
            #TODO: Actually persist new objects
            @question = @survey.questions.create(this_question)
            choices.each_with_index {|x, y| @question.choices.create(:text => x, :order_id => y)}
          end
        #end #Choice.transaction
      end # Question.transaction
    end #Survey.transaction

    respond_to do |format|
      if @survey.save
        format.html { redirect_to "/users/#{@current_user.id}/surveys/#{@survey.id}", notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params[0])
        format.html { redirect_to "/users/#{@current_user.id}/surveys/#{@survey.id}", notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to user_surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def yo_you_should_log_in
     redirect_to '/sign_in' unless @current_user
    end

    def set_survey
      @survey = Survey.find(params[:id])
      @questions = @survey.questions.all
      @my_survey = @current_user.id == @survey.user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.fetch(:survey, {}).permit(:title)
    end

    def questions_params
      params.fetch(:questions, {}).permit!
    end

    def get_current_user_response
      @current_user_response = nil || @survey.responses.find_by(:user_id => @current_user.id) if @survey
      @answers = @current_user_response.answers.all if @current_user_response

    end
end
