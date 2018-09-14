class Post < ApplicationRecord
    belongs_to :user
    # dependent: :destroy means the comments related
    # to the specific post in mention get deleted if the post does.
    has_many :comments, dependent: :destroy
    validates :title, :body, :user_id, presence: true
end
