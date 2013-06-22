class Admin::UserpanelController < ApplicationController
	load_and_authorize_resource :class => User

	def index
		# authorize! :show, User
		@users = User.all		
	end

	def destroy
		@user = User.find(params[:id])
		@user.delete

		redirect_to admin_userpanel_index_path
	end

	def edit
		
		@user = User.find(params[:id])
		@role_admin = @role_moderator = false
		@role_admin = true if  @user.roles.include? Role.find_by_name('admin') 
		@role_moderator = true if  @user.roles.include? Role.find_by_name('moderator') 
	end

	def update

		User.find(params[:id]).update_attributes(@user)
		@user = User.find(params[:id])
		@user.roles.delete_all

		@user.addRole(params[:admin])
		@user.addRole(params[:moderator])
		@user.addRole('user')

		# @user = User.find(params[:id])

		# render 'show'
		redirect_to admin_userpanel_index_path
		# redirect_to admin_userpanel_path(@user)
	end

	def show
		@user = User.find(params[:id])

		
	end
end
