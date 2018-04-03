module ApplicationHelper
  QUOTATION_STATUS = {0 => "New", 1 => "Submitted", 2 => "Reviewed", 3 => "Rejected", 4 => "Approved"}

  def get_quotation_status_name(quotation_status_id)
    return QUOTATION_STATUS[quotation_status_id]
  end
end
