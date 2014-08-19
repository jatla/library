class HomeController < ApplicationController
  def index
  	flash[:notice] = "Please sign in with your Google account to access all features of this website!"
  end
end
