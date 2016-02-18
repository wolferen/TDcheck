class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_user
  	unless current_user
  		redirect_to new_user_session_path, notice: "You must be logged in to access this section"
  	end
  end
end
