class BooksController < ApplicationController
  before_action :authenticate_user!
  #投稿データを保存する
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id #ログイン中のユーザーの情報（ID)を取得
    @book.save
    redirect_to book_path(@book.id)
  end
  #投稿画面を表示
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user #ユーザー情報を表示したいページに定義
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body,)
  end

end
