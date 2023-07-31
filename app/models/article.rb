class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :user
   # has_one_attached :imagePath
    
    validates :title, presence: true
    validates :imagePath, presence: true
    validates :body, presence: true, length: {maximum: 1000}
end
