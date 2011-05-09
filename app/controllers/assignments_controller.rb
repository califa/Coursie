class AssignmentsController < ApplicationController


  def index
    list
    render('list')
  end

  def list
    @assignments = params[:course_id] ? @assignments = Course.find_by_id(params[:course_id]).assignments : Assignment.all
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def new
    @assignment = Assignment.new
    @courses = Course.sorted
  end

  def create
    # Instantiate a new object using form parameters
    @assignment = Assignment.new(params[:assignment])
    # Save the object
    if @assignment.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Assignment created."
      redirect_to(assignment_path(@assignment.id))
    else
      @courses = Course.order('name ASC')
      render('new')
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
    @courses = Course.sorted
  end

  def update
    @assignment = Assignment.find(params[:id])
    # Update the object
    if @assignment.update_attributes(params[:assignment])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Assignment updated."
      redirect_to(assignment_path(@assignment.id))
    else
      # If save fails, redisplay the form so user can fix problems
      @courses = Course.sorted
      render('edit')
    end
  end

  def delete
    @assignment = Assignment.find(params[:id])
  end

  def destroy
    Assignment.find(params[:id]).destroy
    flash[:notice] = "Assignment destroyed."
    redirect_to(assignments_path)
  end

end
