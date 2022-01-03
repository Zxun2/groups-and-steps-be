class Todo < ApplicationRecord
    # model association
    has_many :items, dependent: :destroy
    validates_associated :items
    
    # validations
    validates_presence_of :created_by, :title, :created_by
    # validates :title,  uniqueness: { case_sensitive: false }
    validates :title, length: { minimum: 1 }
  end