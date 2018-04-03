class Customer < ActiveRecord::Base
  validates :company_name, presence: true
  has_many :opportunities
  has_many :quotations
  
  
end