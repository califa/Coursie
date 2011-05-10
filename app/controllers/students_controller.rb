class Event < Struct.new(:class, :name, :date); end

class StudentsController < ApplicationController

  helper_method :human_date
  helper_method :get_tasks

  require 'table_builder'
  require 'table_builder/calendar_helper'
  layout 'dashboard'

  def index
    @student = Student.find(session[:user_id])
    @date = Time.now
    @tasks = get_tasks
  end

  def get_tasks(list_course=nil)
    tasks = []
    if list_course
      list_course.assignments.each do |assignment|
        tasks << Event.new(list_course.name, assignment.title, assignment.due_date)
      end
      tasks.sort! {|x,y| x.date <=> y.date }
      tasks = tasks.slice!(0,4)
    else
      @student.courses.each do |course|
        course.assignments.each do |assignment|
          tasks << Event.new(course.name, assignment.title, assignment.due_date)
        end
      end
      tasks.sort! {|x,y| x.date <=> y.date }
      tasks = tasks.slice!(0,7)
    end
    tasks
  end

  def human_date(date)
    string = ""
    level = 3
    now = Time.now.to_date

    if date >= now.end_of_week.next_week
      string = date.strftime("%m/%d").gsub('0','')
    end

    if date < now.end_of_week.next_week
      string = "Next #{date.strftime('%A')}"
    end

    if date < now.end_of_week
      string = "This #{date.strftime('%A')}"
    end

    if date < now + 5.days
      level = 2
    end

    if date < now + 2.days
      level = 1
    end

    if date == now + 1.days
      string = "Tomorrow!"
    end

    if date < now
      string = "Overdue!"
    end

    [string, level]
  end


  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      flash[:notice] = 'Student updated.'
      redirect_to(users_path)
    else
      render("edit")
    end
  end

end
