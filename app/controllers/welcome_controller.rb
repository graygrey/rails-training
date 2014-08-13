class WelcomeController < ApplicationController
  def index
  	if signed_in?
  		redirect_to articles_url
  	end
  end
end
