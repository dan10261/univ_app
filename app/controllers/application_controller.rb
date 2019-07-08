class ApplicationController < ActionController::Base
  helper_method :logged_in?, :require_student
  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end
  def logged_in?
    !!current_student
  end
  def require_student
    if !logged_in?
      flash[:red] = "you must be logged in to perform that task."
      redirect_to login_path
    end
  end
end
