class BooksController < ApplicationController
  def index
    # your code here
    @books = Book.all
    render :index
  end

  def new
    # your code here
    render :new
  end

  def create
    # your code here
    @books = Book.new(book_params)
    if @books.save
      redirect_to books_url
    else
      render :new
    end
  end

  def destroy
    # your code here
    @book = Book.find_by(id: params[:id])
    @book.destroy
    redirect_to "/books"
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
