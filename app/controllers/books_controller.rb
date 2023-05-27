class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @book2 = Book.new
    @user = @book.user
  end
  def edit
    is_matching_book
      @book = Book.find(params[:id])
  end
  
  def update
    is_matching_book
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book.id) 
    else
      render :edit
    end 
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end
    # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
    def is_matching_book
      user = Book.find(params[:id]).user
      unless user.id == current_user.id
        redirect_to "/books"
      end
    end
  
end
