class SessionController < ApplicationController
	def new
	end

	def create
		user = User.where(:email_address => params[:email_address]).first
		if user.present? && user.authenticate(params[:password]) #returns true or false if the user has logged in successfully
			session[:user_id] = user.id
			redirect_to root_path
		else
			session[:user_id] = nil
			flash[:notice] = "Incorrect user name or password. Please try again."
			redirect_to login_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end