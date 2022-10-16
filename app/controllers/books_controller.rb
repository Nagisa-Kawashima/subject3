class BooksController < ApplicationController
  # before_action :correct_user, only: [:edit]
  before_action :correct_book,only: [:edit]

#

  def edit
    # user_id = params[:id].to_i
    @book = Book.find(params[:id])
    # user_id = @book.user_id
    # login_user_id = current_user.id
    # if(user_id != login_user_id)
    #   redirect_to books_path
    # end
  end


  def index
    @user = current_user
    @book = Book.new
    @books = Book.all

    # @user = User.find(params[:id])
    #↑ params[:id]の時はurlのパスを代入してくるもの

    # @user = User.find(params[:id])
    # @books = @user.books

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if  @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @hoge = Book.new

  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
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

  private



  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

  def correct_book
        @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
  end


end
