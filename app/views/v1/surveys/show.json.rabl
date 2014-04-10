object @survey
attributes :id, :name
child :questions do
  attributes :id => :question_id
  attributes :content
  child :answers do
  attribute :content
  end
end
