class Quotation < ActiveRecord::Base
  validates :customer_id, presence: true
  validates :quotation_status_id, presence: true
  validates :description, presence: true
  
  belongs_to :customer
  has_many :quotation_comments
  
  accepts_nested_attributes_for :quotation_comments
end