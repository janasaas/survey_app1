class SurveysController < ApplicationController

def new
  @survey = Survey.new
  1.times do
    question = @survey.questions.build
    4.times { question.answers.build }
  end
end

def list
  @surveys = current_user.surveys
  @user = current_user
end

def create 
  @survey = current_user.surveys.build(survey_params)
  if @survey.save
    flash[:success] = "Survey created successfully"
    redirect_to(@survey)
  end
end

def show
  @survey = Survey.find(params[:id])
end

def edit
  @survey = Survey.find(params[:id]) 
end

def update
  @survey = Survey.find(params[:id])
  if @survey.update(survey_params)
    redirect_to(@survey)
  end
end

def destroy
  @survey = Survey.find(params[:id])
  if @survey.destroy
    redirect_to :action => 'list'
  end
end

def result
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
end

private
def survey_params
  params.require(:survey).permit(:name, questions_attributes:[:id, :content, :_destroy, answers_attributes: [:id, :content, :_destroy]])
end

end

