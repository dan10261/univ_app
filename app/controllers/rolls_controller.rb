class RollsController < ApplicationController
  before_action :require_student
  
  def create
   debugger      
    @student_course = StudentCourse.new
    @student_course.student_id = session[:student_id]
    @student_course.course_id = params[:course_id]
   if @student_course.save
     flash[:success]="You are enrolled to course"
   else
     flash[:error]="Enroll failed"
   end
    redirect_to courses_path
  end
end