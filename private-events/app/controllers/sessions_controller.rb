class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:session][:username].downcase)
  	if user
  		log_in user
  		redirect_to user
  	else
  		flash.now['danger'] = "Username does not exist"
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
