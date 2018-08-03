class Activity < ActiveRecord::Base
  validates :activity_status_id, presence: true
  validates :user_id, presence: true
  validates :date_created, presence: true

  belongs_to :activity_status
  belongs_to :priority
  belongs_to :opportunity
  belongs_to :log_type
  belongs_to :activity_feeling
  belongs_to :user

  has_many :todos
  
  accepts_nested_attributes_for :todos, allow_destroy: true
end