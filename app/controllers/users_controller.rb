class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to @user
  	else
  		p @user.errors
  		render action: 'new'
  	end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		redirect_to @user
  	else
  		render action: edit
  	end
  end
  

  private
  	def user_params
  		params.require(:user).permit(:first_name,:last_name,:email,:role_ids => [])
  	end
end