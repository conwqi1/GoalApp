class Goal < ActiveRecord::Base
  validates :user_id, :body, :private, presence: true
  belongs_to(
  :user,
  :class_name => "User",
  :foreign_key => :user_id,
  :primary_key => :id
  )
end
