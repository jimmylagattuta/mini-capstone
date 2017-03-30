class SessionsController < ApplicationController

	def new
	end

	def create

		user = User.find_by(email: params[:user_email])

		if user && user.authenticate(params[:user_password])
			session[:user_id] = user.id
			flash[:success] = "You Have Successfully Logged In"
			redirect_to "/products"
		else
			flash[:danger] = "Invalid Email or Password"
			redirect_to "/login"
		end
	end

	def destroy
		if session[:user_id]
			session[:user_id] = nil
			flash[:info] = "You Successfully Logged Out"
			redirect_to "/products"
		else
			flash[:info] = "No Users are Signed in"
			redirect_to "/products"
		end
	end

end
