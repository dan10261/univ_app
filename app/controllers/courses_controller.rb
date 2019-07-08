class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update]
  before_action :require_student
  def home
  end
  
  def index
    @courses = Course.all
  end
  def new
    @course = Course.new
  end
  
  def create
      @course = Course.new(course_params)
      if @course.save
        flash[:success] ="The course is created"
        redirect_to courses_path
      else
        render 'new'
      end
  end
  
  def show
  end
  
  def update
    @course.update(course_params)
  end
  
  private 
  def set_course
    @course = Course.find(params[:id])
  end
  
  def course_params
    params.require(:course).permit(:name, :description,:job_title, :category_id)
  end
end
