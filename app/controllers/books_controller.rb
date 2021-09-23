class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_book,only: [:edit]
  #投稿データを保存する
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id #ログイン中のユーザーの情報（ID)を取得
    if @book.save
      flash[:notice] = "You have created book successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end
  #投稿画面を表示
  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
    @user = current_user #ユーザー情報を表示したいページに定義
  end

  def show
    @book_form = Book.new
    @book = Book.find(params[:id])
    #@user = User.where(id: @book.user_id)
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    flash[:notice] = "You have update book successfully"
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def correct_book
        @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
  end
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
