class V1::SurveysController < ApplicationController

  def list
    @surveys = current_user.surveys
  end


  def show
    @survey = Survey.find(params[:id])   
  end

  skip_before_action :verify_authenticity_token

  def update_response
    @agent_details = params[:response][:agent]
    @surveyee_details = params[:response][:surveyee]

    @survey_id = params[:response][:survey_id]
    @survey = Survey.find(@survey_id)
    @agent_phone = @agent_details[:phone]
    @agent = Agent.find_by_phone(@agent_phone)
    if @agent == nil
        @agent = Agent.new(agent_params)
        @agent.save
    end

    @surveyee_phone = @surveyee_details[:phone]
    @surveyee = Surveyee.find_by_phone(@surveyee_phone)
    if @surveyee == nil
        @surveyee = Surveyee.new(surveyee_params)
        @surveyee.save
    end

    @response_params = { :agent_id => @agent.id, :surveyee_id => @surveyee.id, :qresponses_attributes => params[:response][:qresponses_attributes] }

    @response = @survey.responses.build(@response_params)
    if !(@response.save)
      @message = { :status => "422", :error => @response.errors.full_messages}
    else
      @message = { :status => "200", :success => "Survey response successfully updated"}
    end

  end

private
  def agent_params
    params.require(:response).require(:agent).permit(:first_name, :last_name, :phone)
  end

  def surveyee_params
    params.require(:response).require(:surveyee).permit(:first_name, :last_name, :email, :phone, :age, :sex, :address_1, :address_2, :city, :state, :country, :zip_code, :latitude, :longitude)
  end

end

