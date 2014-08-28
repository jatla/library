class UserConfigsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_config, only: [:show, :edit, :update]

  def show
    if @user_config.nil?
      @user_config = UserConfig.new
      @user_config.user_id = current_user.id
      @user_config.opt_out_by_rating = true
      @user_config.opt_out_by_review = true
      @user_config.rating_threshold = 1
      @user_config.daily_digest_enabled = true
      @user_config.save!
    end
    respond_with(@user_config)
  end

  # GET /user_configs/1/edit
  def edit
  end

  # PATCH/PUT /user_configs/1
  # PATCH/PUT /user_configs/1.json
  def update
    @user_config.update(user_config_params)
    respond_with(@user_config, :flash => true)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_config
      @user_config = UserConfig.find_by(user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_config_params
      params.require(:user_config).permit(:user_id, :rating_threshold, :opt_out_by_rating, :opt_out_by_review, :daily_digest_enabled)
    end
end
