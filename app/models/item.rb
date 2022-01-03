class Item < ApplicationRecord
  # model association
  belongs_to :todo

  # validation
  validates_presence_of :step
  validates_presence_of :todo_id
  validates :step, length: { minimum: 1 }
  # validates_format_of :deadline, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "^Date must be in the following format: dd/mm/yyyy"

end