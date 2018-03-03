class Employee < ActiveRecord::Base
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end
  
  def self.search(param)
    param.strip!
    to_send_back = (matches('first_name', param) + matches('last_name', param)).uniq
    return nil unless to_send_back
    to_send_back
  end
  
  def self.matches(field_name, param)
    where("#{field_name} LIKE ?", "%#{param}%")
  end
end
