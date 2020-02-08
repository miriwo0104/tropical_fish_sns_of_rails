class User < ApplicationRecord
    has_secure_password
    #emailが空、重複、フォーマットが正規表現通りではないとはじく
    validates :email, {presence: true, 
                       uniqueness: true, 
                       format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    }
    
    #nameが空の時はじく
    validates :name, {presence: true,
    }
end
