class Item < ApplicationRecord
  # model association
  belongs_to :todo

  # validation
  validates_presence_of :step
  validates_presence_of :todo_id
  validates :step, length: { minimum: 1 }

end