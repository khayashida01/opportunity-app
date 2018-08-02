class Activity < ActiveRecord::Base
  belongs_to :activity_status
  belongs_to :priority
  belongs_to :opportunity
  belongs_to :log_type
  belongs_to :activity_feeling

  has_many :todos
  
  accepts_nested_attributes_for :todos, allow_destroy: true
end