class Book < ApplicationRecord
  #1つのユーザーがbookモデルに投稿
  belongs_to :user
end
