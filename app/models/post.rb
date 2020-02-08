class Post < ApplicationRecord
    #contentが空、トータル文字数が140文字以下なら保存させない
    validates :content, {presence: true, length: {maximum: 140}}    
end
