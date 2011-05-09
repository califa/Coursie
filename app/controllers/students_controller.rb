class Event < Struct.new(:class, :name, :date); end

class StudentsController < ApplicationController

  helper_method :human_date

  require 'table_builder'
  require 'table_builder/calendar_helper'
  layout 'dashboard'

  def index
    @student = Student.find(session[:user_id])
    @date = Time.now
    get_tasks
  end

  def get_tasks
    @tasks = []
    @student.courses.each do |course|
      course.assignments.each do |assignment|
        @tasks << Event.new(course.name, assignment.title, assignment.due_date)
      end
    end
    @tasks.sort! {|x,y| x.date <=> y.date }
    @tasks = @tasks.slice!(0,7)
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


end
