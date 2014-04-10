class Response < ActiveRecord::Base
belongs_to :survey
belongs_to :agent
belongs_to :surveyee
has_many :qresponses
accepts_nested_attributes_for :qresponses, :reject_if => lambda { |a| a[:answer].blank? }, :allow_destroy => true
validates_uniqueness_of :survey_id, :scope => [:agent_id, :surveyee_id]
end
