class Customer < ActiveRecord::Base
  validates :company_name, presence: true
  has_many :opportunities
  has_many :quotations
  has_many :staffs
  
  accepts_nested_attributes_for :staffs
end