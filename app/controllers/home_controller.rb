class HomeController < ApplicationController
  def index
  	if !user_signed_in?
  		flash[:notice] = "Please sign in with your Google account to access all features of this website!"
  	end
  end

  def invite_user
  	if user_signed_in?
  		LibraryMailer.invite_user(params[:email], User.find(current_user.id)).deliver
  	end
  	render 'index'
  end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params.require(:home).permit(:email)
    end
end
