class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :activities

  
  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end
  
  def supplier?
    return (group_id == ApplicationHelper::GROUP_SUPPLIER)
  end
  
  def employee?
    return (group_id == ApplicationHelper::GROUP_EMPLOYEE)
  end

  def manager?
    return (role_id == ApplicationHelper::ROLE_MANAGER)
  end

  def staff?
    return (role_id == ApplicationHelper::ROLE_STAFF)
  end
end
