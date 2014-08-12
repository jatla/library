class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    if current_user.try(:is_admin?)
      @books = Book.all
    else
      @books = Book.where("is_approved = ? or user_id = ?", true, current_user.id)
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
      respond_to do |format|
        if @book.save
          format.html { redirect_to @book, notice: 'Book was successfully created.' }
          format.json { render action: 'show', status: :created, location: @book }
        else
          format.html { render action: 'new' }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    if ( view_context.is_admin? || view_context.is_owner(@book))
      respond_to do |format|
        if @book.update(book_params)
          format.html { redirect_to @book, notice: 'Book was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    if ( view_context.is_admin? || view_context.is_owner(@book) )
      @book.destroy
      respond_to do |format|
        format.html { redirect_to books_url }
        format.json { head :no_content }
      end
    end
  end

  def approved_books
      Book.all.each { |b| b unless b.is_approved?}
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
