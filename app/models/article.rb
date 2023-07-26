class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
   # has_one_attached :imagePath
    
    validates :title, presence: true
    validates :imagePath, presence: true
    validates :body, presence: true
end
