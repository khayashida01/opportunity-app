class Activity < ActiveRecord::Base
  belongs_to :activity_status
  belongs_to :priority
  belongs_to :opportunity
  has_many :todos
  
  accepts_nested_attributes_for :todos
end