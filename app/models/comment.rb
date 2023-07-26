class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :parent, class_name: 'Comment', optional: true, dependent: :destroy
  has_many :comments, class_name: 'Comment',foreign_key: :parent_id, dependent: :destroy

  validates :commenter, presence: true
  validates :body, presence: true
end
