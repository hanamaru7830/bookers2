class Book < ApplicationRecord
  #1つのユーザーがbookモデルに投稿
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end
