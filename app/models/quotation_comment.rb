class QuotationComment < ActiveRecord::Base
  belongs_to :quotation
  belongs_to :user
end