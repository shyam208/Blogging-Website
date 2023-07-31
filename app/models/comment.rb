class Comment < ApplicationRecord
  belongs_to :article
   belongs_to :parent, class_name: 'Comment', optional: true, dependent: :destroy
   has_many :comments, class_name: 'Comment',foreign_key: :parent_id, dependent: :destroy
  # belongs_to :user

  validates :commenter, presence: true, length: {maximum: 20}
  validates :body, presence: true, length: {maximum: 100}
end
