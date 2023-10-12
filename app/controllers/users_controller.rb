class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		# To work with form_tag: 
		# @user = User.new(username: params[:username], email: params[:email][:address], password: params[:password])

		# To work with top-level naming of input-fields:
		# @user = User.new(username: params[:username], email: params[:email], password: params[:password])

		# To work with hash naming of input-fields:
		@user = User.new(user_params)

		if @user.save
			redirect_to new_user_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end
