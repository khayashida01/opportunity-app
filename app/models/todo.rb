class Todo < ActiveRecord::Base
    belongs_to :activity
    belongs_to :todo_status
    belongs_to :todo_priority
end