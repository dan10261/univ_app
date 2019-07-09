class StudentsController < ApplicationController
  before_action :require_student, except: [:new,:create]
  before_action :current_student, except: [:new,:create]
  before_action :set_student, only: [:edit,:destroy,:show]
  def home
  end
  def index
    @students = Student.all
  end
  
  def new
    @student=Student.new
  end
  
  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success]="Your account is successfully created."
      redirect_to login_path
    else
      flash[:error]="Your account creation failed."
      render 'new'
      
    end
  end
  
  def update
    if current_student.update(student_params)
      flash[:success]="Your account is successfully updated."
      redirect_to student_path(current_student)
    else
      flash[:error]="Your account updating failed."
      render 'edit'
    end
  end
  
  def edit
    
  end
  
  def show
      @my_courses = @student.courses 
  end
  
  def destroy
    if @student == current_student
      @student.destroy
      flash[:error]="Your account is deleted."
      session[:student_id]=nil
      redirect_to login_path
    else
      @student.destroy
      flash[:error]="This student account is deleted."
      redirect_to students_path
    end
    
  end
  
  private 
  def set_student
    @student = Student.find(params[:id])
  end
  def student_params
    params.require(:student).permit(:username,:firstname,:lastname,:email)
  end
end
