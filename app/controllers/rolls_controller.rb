class RollsController < ApplicationController
  before_action :require_student
  
  def create    
    @student_course = StudentCourse.new
    @student_course.student_id = session[:student_id]
    @student_course.course_id = params[:course_id]
   if @student_course.save
     flash[:success]="You are enrolled to course"
   else
     flash[:error]="Enroll failed"
   end
    redirect_to student_path(Student.find(session[:student_id]))
  end
  
  def destroy
    course = Course.find(params[:course_id])
    @student_course = StudentCourse.find_by(student_id: current_student.id, course_id: course.id)
      if  @student_course.destroy
        flash[:success]="You are UnEnroll to course #{course.name}"
      else
        flash[:error]="UnEnroll failed "
      end
    redirect_to student_path(current_student)
  end
end