class ResponsesController < ApplicationController
def new 
  @response = Response.new
  @survey_id = session[:survey_id]
  @agent_id = session[:agent_id]
  @surveyee_id = session[:surveyee_id]
  @survey = Survey.find(@survey_id)
  @response.qresponses.build
  
end
def create
  @response = Response.new(response_params)
  if @response.save
    @survey_id = session[:survey_id]
    @survey = Survey.find(@survey_id)
    session.delete(:survey_id)
    session.delete(:agent_id)
    session.delete(:surveyee_id)
    redirect_to(@survey)
   end 
end
private
def response_params
  params.require(:response).permit(:survey_id, :agent_id, :surveyee_id, qresponses_attributes:[:question_id, :answer])
end

end
