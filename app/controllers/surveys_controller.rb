class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
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
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.fetch(:survey, {}).permit(:title)
    end

    def questions_params
      params.fetch(:questions, {}).permit!
    end
end
