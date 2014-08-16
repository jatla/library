class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    if view_context.is_admin?
      @books = Book.all
    elsif user_signed_in?
      @books = Book.where("is_approved = ? or user_id = ?", true, current_user.id)
    else
      @books = Book.where("is_approved = ?", true)
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    if user_signed_in?
      @book = Book.new
    end
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    if user_signed_in?
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      @book.save
      respond_with(@book, :flash => true)
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    if ( view_context.is_admin? || view_context.is_owner?(@book))
      @book.update(book_params)
      respond_with(@book, :flash => true)
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    if ( view_context.is_admin? || view_context.is_owner?(@book) )
      @book.destroy
      respond_with(@book, :flash => true)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :isbn, :image, :is_active, :is_approved)
    end
end
