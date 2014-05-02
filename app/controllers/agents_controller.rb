class AgentsController < ApplicationController
  def new
    session[:survey_id] = params[:survey_id]
  end

  def create
    @agent = Agent.find_by_phone(params[:agent][:phone])
    if @agent == nil
        @agent = Agent.new(agent_params)
        @agent.save
    end 
    session[:agent_id] = @agent.id
    redirect_to new_surveyee_url
  end

private
def agent_params
  params.require(:agent).permit(:first_name, :last_name, :phone)
end
end
