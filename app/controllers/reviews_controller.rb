class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_book

  def index
    @reviews = @book.reviews
    respond_with(@book, @review)
  end

  def show
    respond_with(@book, @review)
  end

  def new
    @review = Review.new
    session[:prev_page] = request.env['HTTP_REFERER']
    respond_with(@book, @review)
  end

  def edit
    session[:prev_page] = request.env['HTTP_REFERER']
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.book_id = @book.id
    if !@review.save
      flash[:error] = "Could not save review!"
    end
      respond_with(@book)
  end

  def update
    @review.update(review_params)
    respond_with(@book, @review)
  end

  def destroy
    @review.destroy
    redirect_to(:back)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    def review_params
      params.require(:review).permit(:description, :rating, :book_id)
    end
end
