class Address < ApplicationRecord
    validates :address, {presence: true, 
                        uniqueness: true, 
                        format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    }
end
