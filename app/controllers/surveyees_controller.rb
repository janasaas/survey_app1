class SurveyeesController < ApplicationController
def new
end
def create
  @surveyee = Surveyee.find_by_phone(params[:surveyee][:phone])
  if @surveyee == nil
    @surveyee = Surveyee.new(surveyee_params)
    @surveyee.save 
  end
  if @surveyee.responses.find_by_survey_id(session[:survey_id]) == nil
    session[:surveyee_id] = @surveyee.id
    redirect_to new_response_url
  else
    flash.now[:error] = "Surveyee has already answered this survey"
    render 'new'
  end

end
private
def surveyee_params
    params.require(:surveyee).permit(:first_name, :last_name, :email, :phone, :age, :sex, :address_1, :address_2, :city, :state, :country, :zip_code, :latitude, :longitude)
end
end
