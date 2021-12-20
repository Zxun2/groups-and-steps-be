class User < ApplicationRecord
    # encrypt password
    has_secure_password
  
    # Model associations
    has_many :todos, foreign_key: :created_by

    
    # Validations
    validates_presence_of :name, :email, :password_digest
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :name, length: { minimum: 6 }
    validates :password, length: { in: 6..20 }
  end