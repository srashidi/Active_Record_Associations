class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		log_in @user
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  	@created_events = @user.created_events
  	@upcoming_events = @user.upcoming_events
  	@past_events = @user.past_events
  end

  def index
  	@users = User.all
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :username)
  	end
end