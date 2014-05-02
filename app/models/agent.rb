class Agent < ActiveRecord::Base
has_many :responses
validates :phone, presence: true
end
