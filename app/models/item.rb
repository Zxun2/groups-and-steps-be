class Item < ApplicationRecord
  # model association
  belongs_to :todo

  # validation
  validates_presence_of :step

end