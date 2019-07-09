class SessionsController < ApplicationController
  before_action :logged_in_already, only: [:new,:create]
  def new
    
  end
  def create
    student = Student.find_by(username: params[:session][:username])
      if student
        flash[:success] = "you are successfully log in."
        session[:student_id] = student.id
         if student.username.downcase == 'admin'
           session[:admin] = 'Y'
         end
        redirect_to courses_path
      else
        session[:admin] = nil
        flash[:error] = "login failed."
        redirect_to login_path
      end
  end
  
  def destroy
    session[:student_id] = nil
    session[:admin] = nil
    flash[:success] = "you are successfully log out."
    redirect_to login_path
  end
  
  private
  def logged_in_already
    if logged_in?
      flash[:success] ="You are already login."
      redirect_to courses_path
    end
  end
end