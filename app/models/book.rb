class Book < ApplicationRecord
  #1つのユーザーがbookモデルに投稿
  belongs_to :user
  attachment :profile_image
  
  validates :title, presence: true
  validates :book, presence: true, length: { maximum: 200 }
end
