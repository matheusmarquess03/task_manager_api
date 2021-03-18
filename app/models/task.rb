class Task < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :user_id

  

  scope :visible, -> { where(visibility: true) }
  scope :invisible, -> { where(visibility: false) }
  scope :completed, -> { where(status: true) }
  scope :incomplete, -> { where(status: false) } 
 

end
