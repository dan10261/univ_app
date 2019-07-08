class StudentsController < ApplicationController
  before_action :require_student
  before_action :current_student
  def home
  end
  
  def update
    
  end
  
  def show
      @my_courses = @current_student.courses 
  end
  
end
