class BooksController < ApplicationController
  before_action :set_book, only: [:show, :follow, :stop_following]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy, :follow, :stop_following]
  load_and_authorize_resource :only => [:edit, :update, :destroy]

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
    if user_signed_in?
      @book_preferences = OptedOut.where("book_id = ? AND user_id = ?",params[:id], current_user.id)[0]
      @is_followed_by_cuurent_user = Follow.find_by_book_id_and_user_id(@book.id, current_user.id).nil?
    end
  end

  # GET /books/new
  def new
      @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      @book.save
      respond_with(@book, :flash => true)
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
      @book.update(book_params)
      respond_with(@book, :flash => true)
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
      @book.destroy
      respond_with(@book, :flash => true)
  end

  def follow
      @follow = Follow.new
      @follow.user_id = current_user.id
      @follow.book_id = @book.id
      if !@follow.save
        flash[:error] = "Unable to process your request. Please try after some time."
      else
        flash[:notice] = "You have elected to follow this book.
                              You would receive review/rating mails, if enabled in preferences."
        LibraryMailer.on_follow(@follow).deliver
      end
      redirect_to book_path
  end

  def stop_following
      count = Follow.delete_all(["book_id = ? AND user_id = ?", @book.id, current_user.id])
      if !count
        flash[:error] = "Unable to process your request. Please try after some time."
      else
        flash[:notice] = "You had stopped following this book successfully."
      end
      redirect_to book_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :isbn, :image, :is_active, :is_approved, tag_ids: [])
    end
end
