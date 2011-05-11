class EnrollmentsController < ApplicationController

  before_filter :confirm_logged_in_teacher

  layout 'admin'

  def index
    list
    render('list')
  end

  def list
    @enrollments = params[:course_id] ? @enrollments = Course.find_by_id(params[:course_id]).enrollments : Enrollment.all
  end

  def show
    @enrollment = Enrollment.find(params[:id])
  end

  def new
    @enrollment = Enrollment.new
    @courses = Course.sorted
    @students = Student.all
  end

  def create
    # Instantiate a new object using form parameters
    @enrollment = Enrollment.new(params[:enrollment])
    # Save the object
    if @enrollment.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Enrollment created."
      redirect_to(enrollment_path(@enrollment.id))
    else
      @courses = Course.order('name ASC')
      render('new')
    end
  end

  def edit
    @enrollment = Enrollment.find(params[:id])
    @courses = Course.sorted
    @students = Student.all
  end

  def update
    @enrollment = Enrollment.find(params[:id])
    # Update the object
    if @enrollment.update_attributes(params[:enrollment])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Enrollment updated."
      redirect_to(enrollment_path(@enrollment.id))
    else
      # If save fails, redisplay the form so user can fix problems
      @courses = Course.sorted
      @students = Student.all
      render('edit')
    end
  end

  def delete
    @enrollment = Enrollment.find(params[:id])
  end

  def destroy
    Enrollment.find(params[:id]).destroy
    flash[:notice] = "Enrollment destroyed."
    redirect_to(enrollments_path)
  end

end
