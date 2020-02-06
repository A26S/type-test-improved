class User < ApplicationRecord
    has_many :test_sessions
    has_many :tests, through: :test_sessions
    has_secure_password

    validates :username, {
        presence: true,
        uniqueness: true
    }

    validates :password, {
        presence: true
    }

    validates :first_name, {
        presence: true
    }

    validates :last_name, {
        presence: true
    }

    validates :age, {
        presence: true
    }

    # Show the users full name
    def to_s
        self.first_name + " " + self.last_name
    end

    # Get all test sessions for current user
    def all_sessions
        self.test_sessions
    end
    
end