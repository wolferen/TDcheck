class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def curr_user
  	unless current_user
  		redirect_to new_user_session_path, notice: "You must be logged in to access this section"
  	end
  end
end
