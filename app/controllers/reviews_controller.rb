class ReviewsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_review, only: :show
  before_action :set_book
  load_and_authorize_resource :only => [:edit, :update, :destroy]

  def index
    @reviews = @book.reviews
    respond_with(@book, @review, :flash => true)
  end

  def show
    respond_with(@book, @review, :flash => true)
  end

  def new
    if (@book.is_active? && !current_user.is_blocked? )
      @review = Review.new
      respond_with(@book, @review, :flash => true)
    end
  end

  def edit
  end

  def create
    if (@book.is_active? && !current_user.is_blocked?)
      @review = Review.new(review_params)
      @review.user_id = current_user.id
      @review.book_id = @book.id
      if !@review.save
        flash[:error] = "Could not save review!"
      else
        LibraryMailer.on_new_review(@review).deliver
      end
      respond_with(@book, :flash => true)
    end
  end

  def update
    @review.update(review_params)
    respond_with(@book, @review)
  end

  def destroy
    @review.destroy
    redirect_to(@book)
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
