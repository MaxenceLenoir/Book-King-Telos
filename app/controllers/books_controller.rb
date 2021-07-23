class BooksController < ApplicationController
  def index
    respond_to do |format|
      @books = params[:query] ? policy_scope(Book).search_by_title(params[:query]) : policy_scope(Book)
      format.html
      format.js { render 'books/index.js.erb' }
    end
  end

  def new
    @book = Book.new
    authorize @book
  end

  def show
    @book = Book.find(params[:id])
    authorize @book
    @cart_element = CartElement.new
  end

  def create
    @book = Book.new(book_params)
    @book.seller = current_seller
    authorize @book
    if @book.save
      redirect_to books_path, notice: "Your book has been added"
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
    authorize @book
  end

  def update
    @book = Book.find(params[:id])
    authorize @book
    if @book.update(book_params)
      redirect_to books_path, notice: "Your book has been updated"
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    authorize @book
    @book.destroy
    redirect_to books_path, notice: "Your book has been destroyed"
  end

  private

  def book_params
    params_book = params.require(:book).permit(:title, :description, :author, :price)
    # We add the fee from our website before creating a book
    params_book[:price] = params_book[:price].to_f + Rails.application.config.x.fees["book-king-fees"]
    params_book
  end
end
