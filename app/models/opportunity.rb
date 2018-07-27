class Opportunity < ActiveRecord::Base
    belongs_to :opportunity_stage
    has_many :activities
end