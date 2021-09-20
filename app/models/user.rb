class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #複数の投稿が1人のユーザーから
  has_many :books, dependent: :destroy
  
   attachment :profile_image
end
