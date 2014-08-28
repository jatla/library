class PreferencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book_preference, only: [:show, :edit, :update, :destroy]
  before_action :set_book

  # GET /preferences/1
  # GET /preferences/1.json
  def show
  end

  # GET /preferences/new
  def new
      @book_preference = OptedOut.new
  end

  # GET /preferences/1/edit
  def edit
  end

  # POST /preferences
  # POST /preferences.json
  def create
    @book_preference = OptedOut.new(book_preference_params)
    @book_preference.user_id = current_user.id
    @book_preference.book_id = @book.id

    if !@book_preference.save!
      flash[:error] = "Could not create book preferences!"
    else
      flash[:notice] = 'Book preferences were successfully created!'
    end
    redirect_to(@book)
  end

  # PATCH/PUT /preferences/1
  # PATCH/PUT /preferences/1.json
  def update
    if @book_preference.update(book_preference_params)
      flash[:notice] = 'Book preferences were successfully updated.'
    else
      flash[:error] = 'Unable to update preferences. Please try after some time!'
    end
    redirect_to(@book)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_preference
      @book_preference = OptedOut.find_by_book_id_and_user_id(params[:book_id], current_user.id)
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_preference_params
      params.require(:opted_out).permit(:by_rating, :rating_threshold, :by_review, :book_id)
    end
end
