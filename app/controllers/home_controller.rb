class HomeController < ApplicationController
  def index
  	if !user_signed_in?
  		flash[:notice] = "Please sign in with your Google account to access all features of this website!"
  	end
  end
end
