# app/lib/message.rb
class Message
    def self.not_found(record = 'record')
      "Sorry, #{record} not found."
    end
  
    def self.invalid_credentials
      'Invalid credentials'
    end
  
    def self.invalid_token
      'Invalid token'
    end
  
    def self.missing_token
      'Missing token'
    end
  
    def self.unauthorized
      'Unauthorized request'
    end
  
    def self.account_created
      'Account created successfully'
    end
  
    def self.account_not_created
      'Account could not be created'
    end
  
    def self.expired_token
      'Sorry, your token has expired. Please login to continue.'
    end

    def self.todos_fetched
      'Todos fetched successfully.'
    end

    def self.todos_updated
      'Todo updated successfully.'
    end

    def self.todos_deleted
      'Todo deleted successfully.'
    end

    def self.todos_created
      'Todo created successfully.'
    end

    def self.item_updated
      'Step updated successfully.'
    end

    def self.item_deleted
      'Step deleted successfully.'
    end

    def self.items_fetched
      'Steps fetched successfully.'
    end
    
    def self.items_created
      'Step created successfully.'
    end
  end