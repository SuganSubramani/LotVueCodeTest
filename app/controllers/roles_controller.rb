class RolesController < ApplicationController
  def index
  	@roles = Role.all
  end

  def new
  	@role = Role.new
  end

  def edit
  	@role = Role.find(params[:id])
  end

  def show
  	@role = Role.find(params[:id])
  end

  def create
  	@role = Role.new(role_params)
  	if @role.save
  		redirect_to @role
  	else
  		p @role.errors
  		render action: 'new'
  	end
  end

  def update
  	@role = Role.find(params[:id])
  	if @role.update_attributes(role_params)
  		redirect_to @role
  	else
  		render action: edit
  	end
  end
  def display_all_users
  	@users = User.where('id not in (?)',UserRole.all.map(&:id))
  end
  def hide_roles
  	@roles = Role.all
  end

  private
  	def role_params
  		params.require(:role).permit(:name)
  	end
end
