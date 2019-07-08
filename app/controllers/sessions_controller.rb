class SessionsController < ApplicationController
  before_action :logged_in_already, only: [:new,:create]
  def new
    
  end
  def create
    student = Student.find_by(username: params[:session][:username])
      if student
        flash[:success] = "you are successfully log in."
        session[:student_id] = student.id
        redirect_to courses_path
      else
        flash[:error] = "login failed."
        redirect_to login_path
      end
  end
  
  def destroy
    session[:student_id] = nil
    flash[:success] = "you are successfully log out."
    redirect_to login_path
  end
  
  private
  def logged_in_already
    if logged_in?
      flash[:success] ="You are already login"
      redirect_to courses_path
    end
  end
end