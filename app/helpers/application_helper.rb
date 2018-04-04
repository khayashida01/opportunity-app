module ApplicationHelper
  QUOTATION_STATUS_NEW = 0
  QUOTATION_STATUS_SUBMITTED = 1
  QUOTATION_STATUS_REVIEWED = 2
  QUOTATION_STATUS_REJECTED = 3
  QUOTATION_STATUS_APPROVED = 4
  QUOTATION_STATUS = {QUOTATION_STATUS_NEW => "New", QUOTATION_STATUS_SUBMITTED => "Submitted", QUOTATION_STATUS_REVIEWED => "Reviewed",
                      QUOTATION_STATUS_REJECTED => "Rejected", QUOTATION_STATUS_APPROVED => "Approved"}

  def get_quotation_status_name(quotation_status_id)
    return QUOTATION_STATUS[quotation_status_id]
  end
end
