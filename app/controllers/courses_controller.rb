class CoursesController < ApplicationController
  
  
  
  def index
    list
    render('list')
  end
  
  def list
    @courses = Course.sorted
  end
  
  def show
    @course = Course.find(params[:id])
  end
  
  def new
    @course = Course.new
    @teachers = Teacher.order('last_name ASC')
  end
  
  def create
    # Instantiate a new object using form parameters
    @course = Course.new(params[:course])
    # Save the object
    if @course.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Course created."
      redirect_to(course_path(@course.id))
    else
      @teachers = Teacher.order('last_name ASC')
      render('new')
    end
  end
  
  def edit
    @course = Course.find(params[:id])
    @teachers = Teacher.order('last_name ASC')
  end
  
  def update
    @course = Course.find(params[:id])
    # Update the object
    if @course.update_attributes(params[:course])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Course updated."
      redirect_to(course_path(@course.id))
    else
      # If save fails, redisplay the form so user can fix problems
      @teachers = Teacher.order('last_name ASC')
      render('edit')
    end
  end
  
  def delete
    @course = Course.find(params[:id])
  end
  
  def destroy
    Course.find(params[:id]).destroy
    flash[:notice] = "Course destroyed."
    redirect_to(course_path)
  end

  private



end
