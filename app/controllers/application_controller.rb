class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def visit_count
  	if session[:count]
  		session[:count] += 1
		else
			session[:count] = 0
		end

		@visit_count = session[:count]
	end
	helper_method :visit_count

	def authenticate_user!
		if !current_user
			flash[:danger] = "You Must Be Logged In"
			redirect_to "/login"
		end
	end

	def authenticate_admin!
		if !(current_user && current_user.admin)
			flash[:danger] = "You Must Be an Admin"
			redirect_to "/products"
		end 

	end



end
