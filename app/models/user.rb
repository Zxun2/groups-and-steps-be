class User < ApplicationRecord
    # encrypt password
    has_secure_password
  
    # Model associations
    has_many :todos, foreign_key: :created_by

    
    # Validations
    validates_presence_of :name, :email, :password_digest
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :name, length: { minimum: 2 }
    # validates :bio, length: { maximum: 500 }, presence: false
    validates :password, length: { in: 6..20 }
  end